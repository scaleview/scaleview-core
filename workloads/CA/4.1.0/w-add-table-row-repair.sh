##########################################################################
#!/bin/bash
##########################################################################
## Always source first...
source environment.sh

NUM_KS="$1"
SLEEP_BETWEEN_STEPS="$2"
CLUSTER_BASE="$3"
SLEEP_N=60
SLEEP_B=15

if ! isInteger "$NUM_KS" || ! isInteger "$SLEEP_BETWEEN_STEPS" ||  ! isDirectory "$CLUSTER_BASE" || [ "$#" -ne 3 ]; then
  echo "[$0] USAGE: $0 <num_tables> <sleep_bet_steps> <cluster_base>"
  echo "[$0] <num_tables>: Number of keyspaces that will be created."
  echo "[$0] <sleep_bet_steps>: How many seconds to wait between steps."
  echo "[$0] <cluster_base>: Where to create the cluster."
  exit 1
fi

## lets kill everyone before we start...
killAllCassandraProcesses

## now, lets make nodes, we need one...
echo "[$0] Setting up node at [$CLUSTER_BASE]"
rm -rf $CLUSTER_BASE/*
./setup-node.sh node-1 $CLUSTER_BASE $DEFAULT_TOKENS 127.0.0.1
./start-node.sh $CLUSTER_BASE/node-1 $JMX_DEFAULT true
echo "[$0] Sleeping [$SLEEP_N] seconds before proceeding (wait for node start)"
sleep $SLEEP_N

./setup-node.sh node-2 $CLUSTER_BASE $DEFAULT_TOKENS 127.0.0.2
./start-node.sh $CLUSTER_BASE/node-2 $(($JMX_DEFAULT + 1)) false
echo "[$0] Sleeping [$SLEEP_N] seconds before proceeding (wait for node start)"
sleep $SLEEP_N



## the mapping file
MAPPING_FILE=add-table-row-repair-$NUM_KS.nm
TABLE_COUNT=0
ITERATION=0
rm $MAPPING_FILE


## create a single keyspace for all tables
KS="scale_test"
CMD="$PYTHON_CMD cql_utils.py 127.0.0.1 create_simple_ks '{\"ks\":\"$KS\", \"repfactor\":2}'"
## run the cmd...
eval "$CMD"
## and now, we do the workload...
echo "[$0] Executing workload...."
for (( i = 1; i <= $NUM_KS; i++ )); do
  NR=$(($i * 25))
  echo "[$0] Adding table [$i], [$NR] rows"
  ## go for a single table
  CMD="$PYTHON_CMD cql_utils.py 127.0.0.1 create_simple_table '{\"ks\":\"$KS\", \"table\":\"test_$i\", \"repfactor\":2, \"num_cols\":1, \"new_ks\":false, \"drop_ks\":false}'"
  eval "$CMD"
  ## finally, put some data
  CMD="$PYTHON_CMD cql_utils.py 127.0.0.1 insert_rows_to '{\"next_id\":1, \"num_rows\":$NR, \"ks\":\"$KS\", \"tbl\":\"test_$i\"}'"
  eval "$CMD"
  sleep $SLEEP_B
  ## now, we measure
  printf "cmd=heapMeasure\nrunId=$i\ngcBefore=false\nenableLoopProfiling=true" >  $CLUSTER_BASE/node-1/$CMD_FILE
  ## and we repair
  SNAP_CMD="./nodetool -h 127.0.0.1 -p $JMX_DEFAULT repair $KS"
  echo "[$0] Executing [$SNAP_CMD]"
  eval $SNAP_CMD
  TABLE_COUNT=$i
  ROW_COUNT=$NR
  ITERATION=$(($i - 1))
  echo "$ITERATION,$TABLE_COUNT,$ROW_COUNT" >> $MAPPING_FILE
  ## now, we wait...
  echo "[$0] Sleeping [$SLEEP_BETWEEN_STEPS] seconds before proceeding (wait for measurements to finish)..."
  sleep $SLEEP_BETWEEN_STEPS
done
## shutdown the nodes too...
printf "cmd=shutdown" >  $CLUSTER_BASE/node-1/$CMD_FILE
## and collect results...
RESULTS="add-table-row-repair-$RANDOM"
echo "[$0] Done, collecting measures and traces into $RESULTS"
mkdir $RESULTS
mkdir $RESULTS/node-1
cp -r  $CLUSTER_BASE/node-1/$MS_DIR $RESULTS/node-1/$MS_DIR
cp -r  $CLUSTER_BASE/node-1/$TRACES_DIR $RESULTS/node-1/$TRACES_DIR
cp $CLUSTER_BASE/node-1/logs/system.log $RESULTS/node-1/system.log
cp $MAPPING_FILE $RESULTS/$MAPPING_FILE
## compress it
TAR_NAME="$RESULTS.tar.gz"
echo "[$0] Compressing $RESULTS into $TAR_NAME"
tar -czvf $TAR_NAME $RESULTS
## and delete the rest...
rm -rf $RESULTS
echo "[$0] Mapping file is: "
cat $MAPPING_FILE
rm $MAPPING_FILE
echo "[$0] Done..."
exit 0
