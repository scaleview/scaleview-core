
######################################################################
#!/bin/bash
######################################################################

ANSI_RED="\033[31;1m"
ANSI_GREEN="\033[32;1m"
ANSI_RESET="\033[0m"
ANSI_CLEAR="\033[0K"

print_step () {
    echo -e "\n${ANSI_GREEN}$1${ANSI_RESET}"
}

# Check if --analysis-only is enabled
ANALYSIS_ONLY=0
while [[ $# -gt 0 ]]; do
    case $1 in
        --analysis-only)
            ANALYSIS_ONLY=1
            shift # Remove --analysis-only from processing
            ;;
        *)
            break
            ;;
    esac
done

# Check for correct number of arguments after possibly shifting them
if [ $# -ne 2 ]; then
    echo "[$0] USAGE: $0 [--analysis-only] <config_file> <working_space>"
    echo "[$0] --analysis-only: Run analysis only, skipping workload execution."
    echo "[$0] <config_file>: The configuration file (YAML) for the experiment."
    echo "[$0] <working_space>: The working directory for the experiment."
    exit 1
fi


# set up variables
CONFIG_FILE=$(realpath $1)
WORKING_SPACE=$2

ENTRY_DIR=$(pwd)
REPO_DIR=$(git rev-parse --show-toplevel)
AGENT="$REPO_DIR/agent"
EVENT_PARSING="$REPO_DIR/analysis/eventparsing"
EVENT_FILTERING="$REPO_DIR/analysis/eventfiltering"

# check if agent directory exists
if [ ! -d "$AGENT" ]; then
echo "[$0] [$AGENT] folder does not exist. See readme for instructions."
return $FALSE
fi

if [ ! -e "$CONFIG_FILE" ]; then
    echo "[$0] Configuration file [$CONFIG_FILE] does not exist."
    exit 1
fi

# Run analysis only
if [ $ANALYSIS_ONLY -eq 1 ]; then
    print_step "Running analysis only."
    ## create symlink to agent for analysis
    ln -sf $AGENT $EVENT_PARSING/agent
    ln -sf $AGENT $EVENT_FILTERING/agent
    (cd $WORKING_SPACE && python $ENTRY_DIR/run_analysis.py -c $CONFIG_FILE)
    print_step "Done."
    exit 0
fi


# Run everything from now: build system, run workloads, run analysis
if [ -e "$WORKING_SPACE" ]; then
   rm -rf $WORKING_SPACE
fi
mkdir -p $WORKING_SPACE


SYSTEM_ID=$(yq eval .experiment.system_id $CONFIG_FILE)
SYSTEM=$(yq eval .experiment.system $CONFIG_FILE)
VERSION=$(yq eval .experiment.version $CONFIG_FILE)

# copy workload to working space
print_step "Copying workload to working space"
WORKLOAD_DIR="$(realpath workloads/$SYSTEM_ID/$VERSION)"
cp -r $WORKLOAD_DIR/* $WORKING_SPACE


# build and copy system jar to working space
SYSTEM_DIR="$(realpath systems/$SYSTEM_ID/$VERSION)"
print_step "Building system"
(cd $SYSTEM_DIR && bash build.sh *.tar.gz $SYSTEM_ID-$VERSION)
print_step "Copying system to working space"
cp $SYSTEM_DIR/*.csv $WORKING_SPACE
cp -r $SYSTEM_DIR/system $WORKING_SPACE

# create symlink to agent
print_step "Creating symlink to agent"
ln -sf $AGENT $WORKING_SPACE/agent

# run workloads
print_step "Running workloads"
(cd $WORKING_SPACE && python $ENTRY_DIR/run_workloads.py -c $CONFIG_FILE)

# clean up all files and dirs except for the result: *.tar.gz
print_step "Experiment completed. Cleaning up files."
(cd $WORKING_SPACE && find . -type f ! \( -name "*.tar.gz" -o -name "*.csv" \) -delete && find . -type d -empty -delete)

# run analysis in the same working space
print_step "Running analysis"
## create symlink to agent for analysis
ln -sf $AGENT $EVENT_PARSING/agent
ln -sf $AGENT $EVENT_FILTERING/agent
(cd $WORKING_SPACE && python $ENTRY_DIR/run_analysis.py -c $CONFIG_FILE)

# done
print_step "Done."
