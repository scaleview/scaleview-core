#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

####################
### Cluster Configuration
####################

# Used for indicate cluster name and distinguish different cluster.
# Datatype: string
cluster_name=defaultCluster

####################
### Replication configuration
####################

# ConfigNode consensus protocol type.
# This parameter is unmodifiable after ConfigNode starts for the first time.
# These consensus protocols are currently supported:
# 1. org.apache.iotdb.consensus.ratis.RatisConsensus
# 2. org.apache.iotdb.consensus.simple.SimpleConsensus   (Only 1 ConfigNode can be deployed)
# Datatype: string
# config_node_consensus_protocol_class=org.apache.iotdb.consensus.ratis.RatisConsensus

# Default number of schema replicas
# Can not be changed after the first start
# Datatype: int
schema_replication_factor=1

# SchemaRegion consensus protocol type.
# This parameter is unmodifiable after ConfigNode starts for the first time.
# These consensus protocols are currently supported:
# 1. org.apache.iotdb.consensus.ratis.RatisConsensus
# 2. org.apache.iotdb.consensus.simple.SimpleConsensus   (The schema_replication_factor can only be set to 1)
# Datatype: string
# schema_region_consensus_protocol_class=org.apache.iotdb.consensus.ratis.RatisConsensus

# Default number of data replicas
# Can not be changed after the first start
# Datatype: int
data_replication_factor=1

# DataRegion consensus protocol type.
# This parameter is unmodifiable after ConfigNode starts for the first time.
# These consensus protocols are currently supported:
# 1. org.apache.iotdb.consensus.simple.SimpleConsensus   (The data_replication_factor can only be set to 1)
# 2. org.apache.iotdb.consensus.iot.IoTConsensus
# 3. org.apache.iotdb.consensus.ratis.RatisConsensus
# Datatype: string
# data_region_consensus_protocol_class=org.apache.iotdb.consensus.iot.IoTConsensus

####################
### Load balancing configuration
####################

# All parameters in Partition configuration is unmodifiable after ConfigNode starts for the first time.
# And these parameters should be consistent within the ConfigNodeGroup.
# Number of SeriesPartitionSlots per Database
# Datatype: Integer
# series_slot_num=1000

# SeriesPartitionSlot executor class
# These hashing algorithms are currently supported:
# 1. BKDRHashExecutor(Default)
# 2. APHashExecutor
# 3. JSHashExecutor
# 4. SDBMHashExecutor
# Also, if you want to implement your own SeriesPartition executor, you can inherit the SeriesPartitionExecutor class and
# modify this parameter to correspond to your Java class
# Datatype: String
# series_partition_executor_class=org.apache.iotdb.commons.partition.executor.hash.BKDRHashExecutor

# The policy of extension SchemaRegionGroup for each Database.
# These policies are currently supported:
# 1. CUSTOM(Each Database will allocate schema_region_group_per_database RegionGroups as soon as created)
# 2. AUTO(Each Database will automatically extend SchemaRegionGroups based on the data it has)
# Datatype: String
# schema_region_group_extension_policy=AUTO

# When set schema_region_group_extension_policy=CUSTOM,
# this parameter is the default number of SchemaRegionGroups for each Database.
# When set schema_region_group_extension_policy=AUTO,
# this parameter is the default minimal number of SchemaRegionGroups for each Database.
# Datatype: Integer
# default_schema_region_group_num_per_database=1

# Only take effect when set schema_region_group_extension_policy=AUTO.
# This parameter is the maximum number of SchemaRegions expected to be managed by each DataNode.
# Notice: Since each Database requires at least one SchemaRegionGroup to manage its schema,
# this parameter doesn't limit the upper bound of cluster SchemaRegions when there are too many Databases.
# Datatype: Double
# schema_region_per_data_node=1.0

# The policy of extension DataRegionGroup for each Database.
# These policies are currently supported:
# 1. CUSTOM(Each Database will allocate data_region_group_per_database DataRegionGroups as soon as created)
# 2. AUTO(Each Database will automatically extend DataRegionGroups based on the data it has)
# Datatype: String
# data_region_group_extension_policy=AUTO

# When set data_region_group_extension_policy=CUSTOM,
# this parameter is the default number of DataRegionGroups for each Database.
# When set data_region_group_extension_policy=AUTO,
# this parameter is the default minimal number of DataRegionGroups for each Database.
# Datatype: Integer
# default_data_region_group_num_per_database=2

# Only take effect when set data_region_group_extension_policy=AUTO.
# This parameter is the maximum number of DataRegions expected to be managed by each DataNode.
# Notice: Since each Database requires at least two DataRegionGroups to manage its data,
# this parameter doesn't limit the upper bound of cluster DataRegions when there are too many Databases.
# Datatype: Double
# data_region_per_data_node=5.0

# Whether to enable auto leader balance for Ratis consensus protocol.
# The ConfigNode-leader will balance the leader of Ratis-RegionGroups by leader_distribution_policy if set true.
# Notice: Default is false because the Ratis is unstable for this function.
# Datatype: Boolean
# enable_auto_leader_balance_for_ratis_consensus=true

# Whether to enable auto leader balance for IoTConsensus protocol.
# The ConfigNode-leader will balance the leader of IoTConsensus-RegionGroups by leader_distribution_policy if set true.
# Notice: Default is true because the IoTConsensus depends on this function to distribute leader.
# Datatype: Boolean
# enable_auto_leader_balance_for_iot_consensus=true

####################
### Cluster management
####################

# Time partition interval in milliseconds, and partitioning data inside each data region, default is equal to one week
# Can not be changed after the first start
# Datatype: long
# time_partition_interval=604800000

# The heartbeat interval in milliseconds, default is 1000ms
# Datatype: long
# heartbeat_interval_in_ms=1000

# Disk remaining threshold at which DataNode is set to ReadOnly status
# Datatype: double(percentage)
# disk_space_warning_threshold=0.05

####################
### Memory Control Configuration
####################

# Memory Allocation Ratio: StorageEngine, QueryEngine, SchemaEngine, Consensus, StreamingEngine and Free Memory.
# The parameter form is a:b:c:d:e:f, where a, b, c, d, e and f are integers. for example: 1:1:1:1:1:1 , 6:2:1:1:1:1
# If you have high level of writing pressure and low level of reading pressure, please adjust it to for example 6:1:1:1:1:1
# datanode_memory_proportion=3:3:1:1:1:1

# Schema Memory Allocation Ratio: SchemaRegion, SchemaCache, and PartitionCache.
# The parameter form is a:b:c, where a, b and c are integers. for example: 1:1:1 , 6:2:1
# schema_memory_proportion=5:4:1

# Memory allocation ratio in StorageEngine: Write, Compaction
# The parameter form is a:b:c:d, where a, b, c and d are integers. for example: 8:2 , 7:3
# storage_engine_memory_proportion=8:2

# Memory allocation ratio in writing: Memtable, TimePartitionInfo
# Memtable is the total memory size of all memtables
# TimePartitionInfo is the total memory size of last flush time of all data regions
# write_memory_proportion=19:1

# primitive array size (length of each array) in array pool
# Datatype: int
# primitive_array_size=64

# Ratio of compaction memory for chunk metadata maintains in memory when doing compaction
# Datatype: double
# chunk_metadata_size_proportion=0.1

# Ratio of write memory for invoking flush disk, 0.4 by default
# If you have extremely high write load (like batch=1000), it can be set lower than the default value like 0.2
# Datatype: double
# flush_proportion=0.4

# Ratio of write memory allocated for buffered arrays, 0.6 by default
# Datatype: double
# buffered_arrays_memory_proportion=0.6

# Ratio of write memory for rejecting insertion, 0.8 by default
# If you have extremely high write load (like batch=1000) and the physical memory size is large enough,
# it can be set higher than the default value like 0.9
# Datatype: double
# reject_proportion=0.8

# Ratio of memory for the DevicePathCache. DevicePathCache is the deviceId cache, keep only one copy of the same deviceId in memory
# Datatype: double
# device_path_cache_proportion=0.05

# If memory cost of data region increased more than proportion of allocated memory for write, report to system. The default value is 0.001
# Datatype: double
# write_memory_variation_report_proportion=0.001

# When an inserting is rejected, waiting period (in ms) to check system again, 50 by default.
# If the insertion has been rejected and the read load is low, it can be set larger.
# Datatype: int
# check_period_when_insert_blocked=50

# size of ioTaskQueue. The default value is 10
# Datatype: int
# io_task_queue_size_for_flushing=10

# If true, we will estimate each query's possible memory footprint before executing it and deny it if its estimated memory exceeds current free memory
# Datatype: bool
# enable_query_memory_estimation=true

####################
### Schema Engine Configuration
####################

# The schema management mode of schema engine. Currently support Memory and PBTree.
# This config of all DataNodes in one cluster must keep same.
# Datatype: string
# schema_engine_mode=Memory

# cache size for partition.
# This cache is used to improve partition fetch from config node.
# Datatype: int
# partition_cache_size=1000

# Size of log buffer in each metadata operation plan(in byte).
# If the size of a metadata operation plan is larger than this parameter, then it will be rejected by SchemaRegion
# If it sets a value smaller than 0, use the default value 1024*1024
# Datatype: int
# mlog_buffer_size=1048576

# The cycle when metadata log is periodically forced to be written to disk(in milliseconds)
# If sync_mlog_period_in_ms=0 it means force metadata log to be written to disk after each refreshment
# Set this parameter to 0 may slow down the operation on slow disk.
# sync_mlog_period_in_ms=100

# interval num for tag and attribute records when force flushing to disk
# When a certain amount of tag and attribute records is reached, they will be force flushed to disk
# It is possible to lose at most tag_attribute_flush_interval records
# tag_attribute_flush_interval=1000

# max size for a storage block for tags and attributes of one time series. If the combined size of tags and
# attributes exceeds the tag_attribute_total_size, a new storage block will be allocated to continue storing
# the excess data.
# the unit is byte
# Datatype: int
# tag_attribute_total_size=700

# Maximum number of map entries allowed for each of tagMap and attributeMap separately
# the unit is byte
# Datatype: int
# tag_attribute_max_num = 20

# Maximum size allowed for each of map entry separately
# the unit is byte
# Datatype: int
# tag_attribute_entry_max_size = 100

# max measurement num of internal request
# When creating timeseries with Session.createMultiTimeseries, the user input plan, the timeseries num of
# which exceeds this num, will be split to several plans with timeseries no more than this num.
# max_measurement_num_of_internal_request=10000

# Policy of DataNodeSchemaCache eviction.
# Support FIFO and LRU policy. FIFO takes low cache update overhead. LRU takes high cache hit rate.
# datanode_schema_cache_eviction_policy=FIFO

# This configuration parameter sets the maximum number of time series allowed in the cluster.
# The value should be a positive integer representing the desired threshold.
# When the threshold is reached, users will be prohibited from creating new time series.
# -1 means unlimited
# cluster_timeseries_limit_threshold=-1

# This configuration parameter sets the maximum number of device allowed in the cluster.
# The value should be a positive integer representing the desired threshold.
# When the threshold is reached, users will be prohibited from creating new time series.
# -1 means unlimited
# cluster_device_limit_threshold=-1

# This configuration parameter sets the maximum number of Cluster Databases allowed.
# The value should be a positive integer representing the desired threshold.
# When the threshold is reached, users will be prohibited from creating new databases.
# -1 means unlimited.
# database_limit_threshold = -1



####################
### Configurations for creating schema automatically
####################

# Whether creating schema automatically is enabled
# If true, then create database and timeseries automatically when not exists in insertion
# Or else, user need to create database and timeseries before insertion.
# Datatype: boolean
# enable_auto_create_schema=true

# Database level when creating schema automatically is enabled
# e.g. root.sg0.d1.s2
#      we will set root.sg0 as the database if database level is 1
# Datatype: int
# default_storage_group_level=1

# ALL data types: BOOLEAN, INT32, INT64, FLOAT, DOUBLE, TEXT

# register time series as which type when receiving boolean string "true" or "false"
# Datatype: TSDataType
# Options: BOOLEAN, TEXT
# boolean_string_infer_type=BOOLEAN

# register time series as which type when receiving an integer string and using float or double may lose precision
# Datatype: TSDataType
# Options: DOUBLE, FLOAT, INT32, INT64, TEXT
# integer_string_infer_type=DOUBLE

# register time series as which type when receiving a floating number string "6.7"
# Datatype: TSDataType
# Options: DOUBLE, FLOAT, TEXT
# floating_string_infer_type=DOUBLE

# register time series as which type when receiving the Literal NaN.
# Datatype: TSDataType
# Options: DOUBLE, FLOAT, TEXT
# nan_string_infer_type=DOUBLE

# BOOLEAN encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_boolean_encoding=RLE

# INT32 encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_int32_encoding=TS_2DIFF

# INT64 encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_int64_encoding=TS_2DIFF

# FLOAT encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_float_encoding=GORILLA

# DOUBLE encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_double_encoding=GORILLA

# TEXT encoding when creating schema automatically is enabled
# Datatype: TSEncoding
# default_text_encoding=PLAIN

####################
### Query Configurations
####################

# The read consistency level
# These consistency levels are currently supported:
# 1. strong(Default, read from the leader replica)
# 2. weak(Read from a random replica)
# Datatype: string
# read_consistency_level=strong

# Whether to cache meta data(BloomFilter, ChunkMetadata and TimeSeriesMetadata) or not.
# Datatype: boolean
# meta_data_cache_enable=true

# Read memory Allocation Ratio: BloomFilterCache : ChunkCache : TimeSeriesMetadataCache : Coordinator : Operators : DataExchange : timeIndex in TsFileResourceList : others.
# The parameter form is a:b:c:d:e:f:g:h, where a, b, c, d, e, f, g and h are integers. for example: 1:1:1:1:1:1:1:1 , 1:100:200:50:200:200:200:50
# chunk_timeseriesmeta_free_memory_proportion=1:100:200:50:200:200:200:50

# Whether to enable LAST cache
# Datatype: boolean
# enable_last_cache=true

# Core size of ThreadPool of MPP data exchange
# Datatype: int
# mpp_data_exchange_core_pool_size=10

# Max size of ThreadPool of MPP data exchange
# Datatype: int
# mpp_data_exchange_max_pool_size=10

# Max waiting time for MPP data exchange
# Datatype: int
# mpp_data_exchange_keep_alive_time_in_ms=1000

# The max execution time of a DriverTask
# Datatype: int, Unit: ms
# driver_task_execution_time_slice_in_ms=200

# The max capacity of a TsBlock
# Datatype: int, Unit: byte
# max_tsblock_size_in_bytes=131072

# The max number of lines in a single TsBlock
# Datatype: int
# max_tsblock_line_number=1000

# Time cost(ms) threshold for slow query
# Datatype: long
# slow_query_threshold=10000

# The max executing time of query. unit: ms
# Datatype: int
# query_timeout_threshold=60000

# The maximum allowed concurrently executing queries
# Datatype: int
# max_allowed_concurrent_queries=1000

# How many threads can concurrently execute query statement. When <= 0, use CPU core number.
# Datatype: int
# query_thread_count=0

# How many pipeline drivers will be created for one fragment instance. When <= 0, use CPU core number / 2.
# Datatype: int
# degree_of_query_parallelism=0

# The threshold of count map size when calculating the MODE aggregation function
# Datatype: int
# mode_map_size_threshold=10000

# The amount of data iterate each time in server (the number of data strips, that is, the number of different timestamps.)
# Datatype: int
# batch_size=100000

# The memory for external sort in sort operator, when the data size is smaller than sort_buffer_size_in_bytes, the sort operator will use in-memory sort.
# Datatype: long
# sort_buffer_size_in_bytes=1048576

# The threshold of operator count in the result set of EXPLAIN ANALYZE, if the number of operator in the result set is larger than this threshold, operator will be merged.
# Datatype: int
# merge_threshold_of_explain_analyze=10

####################
### Storage Engine Configuration
####################

# Use this value to set timestamp precision as "ms", "us" or "ns".
# Once the precision has been set, it can not be changed.
# Datatype: String
# timestamp_precision=ms

# When the timestamp precision check is enabled, the timestamps those are over 13 digits for ms precision, or over 16 digits for us precision are not allowed to be inserted.
# Datatype: Boolean
# timestamp_precision_check_enabled=true

# Default TTL for databases that are not set TTL by statements, If not set (default), the TTL will be unlimited.
# Negative value means the TTL is unlimited.
# Notice: if this property is changed, previous created database which are not set TTL will also be affected.
# Datatype: long
# Unit: ms
# default_ttl_in_ms=-1

# When the waiting time (in ms) of an inserting exceeds this, throw an exception. 10000 by default.
# If the insertion has been rejected and the read load is low, it can be set larger
# Datatype: int
# max_waiting_time_when_insert_blocked=10000

# Add a switch to enable separate sequence and unsequence data.
# If it is true, then data will be separated into seq and unseq data dir. If it is false, then all data will be written into unseq data dir.
# Datatype: boolean
# enable_separate_data=true

# What will the system do when unrecoverable error occurs.
# Datatype: String
# Optional strategies are as follows:
# 1. CHANGE_TO_READ_ONLY: set system status to read-only and the system only accepts query operations.
# 2. SHUTDOWN: the system will be shutdown.
# handle_system_error=CHANGE_TO_READ_ONLY

# Whether to timed flush sequence tsfiles' memtables.
# Datatype: boolean
# enable_timed_flush_seq_memtable=true

# If a memTable's last update time is older than current time minus this, the memtable will be flushed to disk.
# Only check sequence tsfiles' memtables.
# The default flush interval is 10 * 60 * 1000. (unit: ms)
# Datatype: long
# seq_memtable_flush_interval_in_ms=600000

# The interval to check whether sequence memtables need flushing.
# The default flush check interval is 30 * 1000. (unit: ms)
# Datatype: long
# seq_memtable_flush_check_interval_in_ms=30000

# Whether to timed flush unsequence tsfiles' memtables.
# Datatype: boolean
# enable_timed_flush_unseq_memtable=true

# If a memTable's last update time is older than current time minus this, the memtable will be flushed to disk.
# Only check unsequence tsfiles' memtables.
# The default flush interval is 10 * 60 * 1000. (unit: ms)
# Datatype: long
# unseq_memtable_flush_interval_in_ms=600000

# The interval to check whether unsequence memtables need flushing.
# The default flush check interval is 30 * 1000. (unit: ms)
# Datatype: long
# unseq_memtable_flush_check_interval_in_ms=30000

# The sort algorithms used in the memtable's TVList
# TIM: default tim sort,
# QUICK: quick sort,
# BACKWARD: backward sort
# tvlist_sort_algorithm=TIM

# When the average point number of timeseries in memtable exceeds this, the memtable is flushed to disk. The default threshold is 100000.
# Datatype: int
# avg_series_point_number_threshold=100000

# How many threads can concurrently flush. When <= 0, use CPU core number.
# Datatype: int
# flush_thread_count=0

# In one insert (one device, one timestamp, multiple measurements),
# if enable partial insert, one measurement failure will not impact other measurements
# Datatype: boolean
# enable_partial_insert=true

# the interval to log recover progress of each vsg when starting iotdb
# Datatype: int
# recovery_log_interval_in_ms=5000

# If using v0.13 client to insert data, please set this configuration to true.
# Notice: if using v0.13/v1.0 client or setting Client Version to V_0_13 manually, enable this config will disable insert redirection.
# Datatype: boolean
# 0.13_data_insert_adapt=false

# Verify that TSfiles generated by Flush, Load, and Compaction are correct. The following is verified:
# 1. Check whether the file contains a header and a tail
# 2. Check whether files can be deserialized successfully
# 3. Check whether the file contains data
# 4. Whether there is time range overlap between data, whether it is increased, and whether the metadata index offset of the sequence is correct
# Datatype: boolean
# enable_tsfile_validation=false

####################
### Compaction Configurations
####################
# sequence space compaction: only compact the sequence files
# Datatype: boolean
# enable_seq_space_compaction=true

# unsequence space compaction: only compact the unsequence files
# Datatype: boolean
# enable_unseq_space_compaction=true

# cross space compaction: compact the unsequence files into the overlapped sequence files
# Datatype: boolean
# enable_cross_space_compaction=true

# the selector of cross space compaction task
# Options: rewrite
# cross_selector=rewrite

# the compaction performer of cross space compaction task
# Options: read_point, fast
# cross_performer=fast

# the selector of inner sequence space compaction task
# Options: size_tiered
# inner_seq_selector=size_tiered

# the performer of inner sequence space compaction task
# Options: read_chunk, fast
# inner_seq_performer=read_chunk

# the selector of inner unsequence space compaction task
# Options: size_tiered
# inner_unseq_selector=size_tiered

# the performer of inner unsequence space compaction task
# Options: read_point, fast
# inner_unseq_performer=fast

# The priority of compaction execution
# INNER_CROSS: prioritize inner space compaction, reduce the number of files first
# CROSS_INNER: prioritize cross space compaction, eliminate the unsequence files first
# BALANCE: alternate two compaction types
# compaction_priority=BALANCE

# The size of candidate compaction task queue.
# Datatype: int
# candidate_compaction_task_queue_size = 200

# This parameter is used in two places:
# 1. The target tsfile size of inner space compaction.
# 2. The candidate size of seq tsfile in cross space compaction will be smaller than target_compaction_file_size * 1.5.
# In most cases, the target file size of cross compaction won't exceed this threshold, and if it does, it will not be much larger than it.
# default is 2GB
# Datatype: long, Unit: byte
# target_compaction_file_size=2147483648

# The target chunk size in compaction and when memtable reaches this threshold, flush the memtable to disk.
# default is 1MB
# Datatype: long, Unit: byte
# target_chunk_size=1048576

# The target point nums in one chunk in compaction
# Datatype: long
# target_chunk_point_num=100000

# If the chunk size is lower than this threshold, it will be deserialize into points, default is 128 byte
# Datatype: long, Unit:byte
# chunk_size_lower_bound_in_compaction=128

# If the chunk point num is lower than this threshold, it will be deserialize into points
# Datatype: long
# chunk_point_num_lower_bound_in_compaction=100

# The max file when selecting inner space compaction candidate files
# Datatype: int
# max_inner_compaction_candidate_file_num=30

# The max file when selecting cross space compaction candidate files
# At least one unseq file with it's overlapped seq files will be selected even exceeded this number
# Datatype: int
# max_cross_compaction_candidate_file_num=500

# The max total size when selecting cross space compaction candidate files
# At least one unseq file with it's overlapped seq files will be selected even exceeded this number
# Datatype: long, Unit: byte
# max_cross_compaction_candidate_file_size=5368709120

# The min inner compaction level of unsequence file which can be selected as candidate
# Datatype: int
# min_cross_compaction_unseq_file_level=1

# If one merge file selection runs for more than this time, it will be ended and its current
# selection will be used as final selection.
# When < 0, it means time is unbounded.
# Datatype: long, Unit: ms
# cross_compaction_file_selection_time_budget=30000

# How many threads will be set up to perform compaction, 10 by default.
# Set to 1 when less than or equal to 0.
# Datatype: int
# compaction_thread_count=10

# The interval of compaction task schedule
# Datatype: long, Unit: ms
# compaction_schedule_interval_in_ms=60000

# The interval of compaction task submission
# Datatype: long, Unit: ms
# compaction_submission_interval_in_ms=60000

# The limit of write throughput merge can reach per second
# values less than or equal to 0 means no limit
# Datatype: int, Unit: megabyte
# compaction_write_throughput_mb_per_sec=16

# The limit of read throughput merge can reach per second
# values less than or equal to 0 means no limit
# Datatype: int, Unit: megabyte
# compaction_read_throughput_mb_per_sec=0

# The limit of read operation merge can reach per second
# values less than or equal to 0 means no limit
# Datatype: int
# compaction_read_operation_per_sec=0

# The number of sub compaction threads to be set up to perform compaction.
# Currently only works for nonAligned data in cross space compaction and unseq inner space compaction.
# Set to 1 when less than or equal to 0.
# Datatype: int
# sub_compaction_thread_count=4

# Redundancy value of disk availability, only use for inner compaction.
# When disk availability is lower than the sum of (disk_space_warning_threshold + inner_compaction_task_selection_disk_redundancy), inner compaction tasks containing mods files are selected first.
# DataType: double
# inner_compaction_task_selection_disk_redundancy=0.05

# Mods file size threshold, only use for inner compaction.
# When the size of the mods file corresponding to TsFile exceeds this value, inner compaction tasks containing mods files are selected first.
# DataType: long
# inner_compaction_task_selection_mods_file_threshold=10485760

# The number of threads to be set up to select compaction task.
# Datatype: int
# compaction_schedule_thread_num=4

####################
### Write Ahead Log Configuration
####################

# Write mode of wal
# The details of these three modes are as follows:
# 1. DISABLE: the system will disable wal.
# 2. SYNC: the system will submit wal synchronously, write request will not return until its wal is fsynced to the disk successfully.
# 3. ASYNC: the system will submit wal asynchronously, write request will return immediately no matter its wal is fsynced to the disk successfully.
# The write performance order is DISABLE > ASYNC > SYNC, but only SYNC mode can ensure data durability.
# wal_mode=ASYNC

# Max number of wal nodes, each node corresponds to one wal directory
# This parameter is only valid in the standalone mode. IoTConsensus uses one wal per data region and RatisConsensus doesn't use wal.
# The default value 0 means the number is determined by the system, the number is in the range of [data region num / 2, data region num].
# Notice: this value affects write performance significantly.
# For non-SSD disks, values between one third and half of databases number are recommended.
# Datatype: int
# max_wal_nodes_num=0

# Duration a wal flush operation will wait before calling fsync in the async mode
# A duration greater than 0 batches multiple wal fsync calls into one. This is useful when disks are slow or WAL write contention exists.
# Notice: this value affects write performance significantly, values in the range of 10ms-2000ms are recommended.
# Datatype: long
# wal_async_mode_fsync_delay_in_ms=1000

# Duration a wal flush operation will wait before calling fsync in the sync mode
# A duration greater than 0 batches multiple wal fsync calls into one. This is useful when disks are slow or WAL write contention exists.
# Notice: this value affects write performance significantly, values in the range of 0ms-10ms are recommended.
# Datatype: long
# wal_sync_mode_fsync_delay_in_ms=3

# Buffer size of each wal node
# If it's a value smaller than 0, use the default value 32 * 1024 * 1024 bytes (32MB).
# Datatype: int
# wal_buffer_size_in_byte=33554432

# Blocking queue capacity of each wal buffer, restricts maximum number of WALEdits cached in the blocking queue.
# Datatype: int
# wal_buffer_queue_capacity=500

# Size threshold of each wal file
# When a wal file's size exceeds this, the wal file will be closed and a new wal file will be created.
# If it's a value smaller than 0, use the default value 30 * 1024 * 1024 (30MB).
# Datatype: long
# wal_file_size_threshold_in_byte=31457280

# Minimum ratio of effective information in wal files
# This value should be between 0.0 and 1.0
# If effective information ratio is below this value, MemTable snapshot or flush will be triggered.
# Increase this value when wal occupies too much disk space. But, if this parameter is too large, the write performance may decline.
# Datatype: double
# wal_min_effective_info_ratio=0.1

# MemTable size threshold for triggering MemTable snapshot in wal
# When a memTable's size (in byte) exceeds this, wal can flush this memtable to disk, otherwise wal will snapshot this memtable in wal.
# If it's a value smaller than 0, use the default value 8 * 1024 * 1024 bytes (8MB).
# Datatype: long
# wal_memtable_snapshot_threshold_in_byte=8388608

# MemTable's max snapshot number in wal
# If one memTable's snapshot number in wal exceeds this value, it will be flushed to disk.
# Datatype: int
# max_wal_memtable_snapshot_num=1

# The period when outdated wal files are periodically deleted
# If this value is too large, outdated wal files may not able to be deleted in time.
# If it's a value smaller than 0, use the default value 20 * 1000 ms (20 seconds).
# Datatype: long
# delete_wal_files_period_in_ms=20000

# The minimum size of wal files when throttle down in IoTConsensus
# If this value is not set, it will be carefully chosen according to the available disk space.
# If this value is set smaller than 0, it will default to 50 * 1024 * 1024 * 1024 bytes (50GB).
# Datatype: long
# iot_consensus_throttle_threshold_in_byte=53687091200

# Maximum wait time of write cache in IoTConsensus
# If this value is less than or equal to 0, use the default value 10 * 1000 ms (10s)
# Datatype: long
# iot_consensus_cache_window_time_in_ms=-1

####################
### IoTConsensus Configuration
####################

# The maximum log entries num in IoTConsensus Batch
# Datatype: int
# data_region_iot_max_log_entries_num_per_batch = 1024

# The maximum size in IoTConsensus Batch
# Datatype: int
# data_region_iot_max_size_per_batch = 16777216

# The maximum pending batches num in IoTConsensus
# Datatype: int
# data_region_iot_max_pending_batches_num = 5

# The maximum memory ratio for queue in IoTConsensus
# Datatype: double
# data_region_iot_max_memory_ratio_for_queue = 0.6

# The maximum transit size in byte per second for region migration
# values less than or equal to 0 means no limit
# Datatype: long
# region_migration_speed_limit_bytes_per_second = 33554432

####################
### TsFile Configurations
####################

# Datatype: int
# group_size_in_byte=134217728

# The memory size for each series writer to pack page, default value is 64KB
# Datatype: int
# page_size_in_byte=65536

# The maximum number of data points in a page, default 10000
# Datatype: int
# max_number_of_points_in_page=10000

# The threshold for pattern matching in regex
# Datatype: int
# pattern_matching_threshold=1000000

# Floating-point precision
# Datatype: int
# float_precision=2

# Encoder of value series. default value is PLAIN.
# For int, long data type, also supports TS_2DIFF and RLE(run-length encoding), GORILLA and ZIGZAG.
# value_encoder=PLAIN

# Compression configuration
# Data compression method, supports UNCOMPRESSED, SNAPPY, ZSTD, LZMA2 or LZ4. Default value is LZ4
# And it is also used as the default compressor of time column in aligned timeseries.
# compressor=LZ4

####################
### Authorization Configuration
####################

# which class to serve for authorization. By default, it is LocalFileAuthorizer.
# Another choice is org.apache.iotdb.commons.auth.authorizer.OpenIdAuthorizer
# authorizer_provider_class=org.apache.iotdb.commons.auth.authorizer.LocalFileAuthorizer

# If OpenIdAuthorizer is enabled, then openID_url must be set.
# openID_url=

# encryption provider class
# iotdb_server_encrypt_decrypt_provider=org.apache.iotdb.commons.security.encrypt.MessageDigestEncrypt

# encryption provided class parameter
# iotdb_server_encrypt_decrypt_provider_parameter=

# Cache size of user and role
# Datatype: int
# author_cache_size=1000

# Cache expire time of user and role
# Datatype: int
# author_cache_expire_time=30

####################
### UDF Configuration
####################

# Used to estimate the memory usage of text fields in a UDF query.
# It is recommended to set this value to be slightly larger than the average length of all text
# records.
# Datatype: int
# udf_initial_byte_array_length_for_memory_control=48

# How much memory may be used in ONE UDF query (in MB).
# The upper limit is 20% of allocated memory for read.
# Datatype: float
# udf_memory_budget_in_mb=30.0

# UDF memory allocation ratio.
# The parameter form is a:b:c, where a, b, and c are integers.
# udf_reader_transformer_collector_memory_proportion=1:1:1

# UDF lib dir
# If this property is unset, system will save the data in the default relative path directory under
# the UDF folder(i.e., %CONFIGNODE_HOME%/ext/udf).
#
# If it is absolute, system will save the data in exact location it points to.
# If it is relative, system will save the data in the relative path directory it indicates under the
# UDF folder.
# Note: If data_dir is assigned an empty string(i.e.,zero-size), it will be handled as a relative
# path.
#
# For Windows platform
# If its prefix is a drive specifier followed by "\\", or if its prefix is "\\\\", then the path is
# absolute. Otherwise, it is relative.
# udf_lib_dir=ext\\udf
#
# For Linux platform
# If its prefix is "/", then the path is absolute. Otherwise, it is relative.
# udf_lib_dir=ext/udf

####################
### Trigger Configuration
####################

# Uncomment the following field to configure the trigger lib directory.
# For Windows platform
# If its prefix is a drive specifier followed by "\\", or if its prefix is "\\\\", then the path is
# absolute. Otherwise, it is relative.
# trigger_lib_dir=ext\\trigger
# For Linux platform
# If its prefix is "/", then the path is absolute. Otherwise, it is relative.
# trigger_lib_dir=ext/trigger

# How many times will we retry to found an instance of stateful trigger on DataNodes
# 3 by default.
# Datatype: int
# stateful_trigger_retry_num_when_not_found=3


####################
### Select-Into Configuration
####################

# The maximum memory occupied by the data to be written when executing select-into statements.
# Datatype: long
# into_operation_buffer_size_in_byte=104857600

# The maximum number of rows can be processed in insert-tablet-plan when executing select-into statements.
# When <= 0, use 10000.
# Datatype: int
# select_into_insert_tablet_plan_row_limit=10000

# The number of threads in the thread pool that execute insert-tablet tasks
# Datatype: int
# into_operation_execution_thread_count=2

####################
### Continuous Query Configuration
####################

# The number of threads in the scheduled thread pool that submit continuous query tasks periodically
# Datatype: int
# continuous_query_submit_thread_count=2

# The minimum value of the continuous query execution time interval
# Datatype: long(duration)
# continuous_query_min_every_interval_in_ms=1000

####################
### Pipe Configuration
####################

# Uncomment the following field to configure the pipe lib directory.
# For Windows platform
# If its prefix is a drive specifier followed by "\\", or if its prefix is "\\\\", then the path is
# absolute. Otherwise, it is relative.
# pipe_lib_dir=ext\\pipe
# For Linux platform
# If its prefix is "/", then the path is absolute. Otherwise, it is relative.
# pipe_lib_dir=ext/pipe

# The maximum number of threads that can be used to execute the pipe subtasks in PipeSubtaskExecutor.
# The actual value will be min(pipe_subtask_executor_max_thread_num, max(1, CPU core number / 2)).
# pipe_subtask_executor_max_thread_num=5

# The connection timeout (in milliseconds) for the thrift client.
# pipe_sink_timeout_ms=900000

# The maximum number of selectors that can be used in the sink.
# Recommend to set this value to less than or equal to pipe_sink_max_client_number.
# pipe_sink_selector_number=4

# The maximum number of clients that can be used in the sink.
# pipe_sink_max_client_number=16

# Whether to enable receiving pipe data through air gap.
# The receiver can only return 0 or 1 in tcp mode to indicate whether the data is received successfully.
# pipe_air_gap_receiver_enabled=false

# The port for the server to receive pipe data through air gap.
# pipe_air_gap_receiver_port=9780

####################
### RatisConsensus Configuration
####################

# max payload size for a single log-sync-RPC from leader to follower(in byte, by default 16MB)
# config_node_ratis_log_appender_buffer_size_max=16777216
# schema_region_ratis_log_appender_buffer_size_max=16777216
# data_region_ratis_log_appender_buffer_size_max=16777216

# trigger a snapshot when snapshot_trigger_threshold logs are written
# config_node_ratis_snapshot_trigger_threshold=400000
# schema_region_ratis_snapshot_trigger_threshold=400000
# data_region_ratis_snapshot_trigger_threshold=400000

# allow flushing Raft Log asynchronously
# config_node_ratis_log_unsafe_flush_enable=false
# schema_region_ratis_log_unsafe_flush_enable=false
# data_region_ratis_log_unsafe_flush_enable=false

# max capacity of a single Log segment file (in byte, by default 24MB)
# config_node_ratis_log_segment_size_max_in_byte=25165824
# schema_region_ratis_log_segment_size_max_in_byte=25165824
# data_region_ratis_log_segment_size_max_in_byte=25165824
# config_node_simple_consensus_log_segment_size_max_in_byte=25165824

# flow control window for ratis grpc log appender
# config_node_ratis_grpc_flow_control_window=4194304
# schema_region_ratis_grpc_flow_control_window=4194304
# data_region_ratis_grpc_flow_control_window=4194304
# config_node_ratis_grpc_leader_outstanding_appends_max=128
# schema_region_ratis_grpc_leader_outstanding_appends_max=128
# data_region_ratis_grpc_leader_outstanding_appends_max=128
# config_node_ratis_log_force_sync_num=128
# schema_region_ratis_log_force_sync_num=128
# data_region_ratis_log_force_sync_num=128

# min election timeout for leader election
# config_node_ratis_rpc_leader_election_timeout_min_ms=2000
# schema_region_ratis_rpc_leader_election_timeout_min_ms=2000
# data_region_ratis_rpc_leader_election_timeout_min_ms=2000

# max election timeout for leader election
# config_node_ratis_rpc_leader_election_timeout_max_ms=4000
# schema_region_ratis_rpc_leader_election_timeout_max_ms=4000
# data_region_ratis_rpc_leader_election_timeout_max_ms=4000

# ratis client retry threshold
# config_node_ratis_request_timeout_ms=10000
# schema_region_ratis_request_timeout_ms=10000
# data_region_ratis_request_timeout_ms=10000

# currently we use exponential back-off retry policy for ratis
# config_node_ratis_max_retry_attempts=10
# config_node_ratis_initial_sleep_time_ms=100
# config_node_ratis_max_sleep_time_ms=10000
# schema_region_ratis_max_retry_attempts=10
# schema_region_ratis_initial_sleep_time_ms=100
# schema_region_ratis_max_sleep_time_ms=10000
# data_region_ratis_max_retry_attempts=10
# data_region_ratis_initial_sleep_time_ms=100
# data_region_ratis_max_sleep_time_ms=10000

# first election timeout
# ratis_first_election_timeout_min_ms=50
# ratis_first_election_timeout_max_ms=150

# preserve certain logs when take snapshot and purge
# config_node_ratis_preserve_logs_num_when_purge=1000
# schema_region_ratis_preserve_logs_num_when_purge=1000
# data_region_ratis_preserve_logs_num_when_purge=1000

# Raft Log disk size control
# config_node_ratis_log_max_size = 2147483648
# schema_region_ratis_log_max_size = 2147483648
# data_region_ratis_log_max_size = 21474836480

# Raft periodic snapshot interval, time unit is second
# config_node_ratis_periodic_snapshot_interval=86400
# schema_region_ratis_periodic_snapshot_interval=86400
# data_region_ratis_periodic_snapshot_interval=86400

####################
### Procedure Configuration
####################

# Default number of worker thread count
# Datatype: int
# procedure_core_worker_thread_count=4

# Default time interval of completed procedure cleaner work in, time unit is second
# Datatype: int
# procedure_completed_clean_interval=30

# Default ttl of completed procedure, time unit is second
# Datatype: int
# procedure_completed_evict_ttl=800

####################
### MQTT Broker Configuration
####################

# whether to enable the mqtt service.
# Datatype: boolean
# enable_mqtt_service=false

# the mqtt service binding host.
# Datatype: String
# mqtt_host=127.0.0.1

# the mqtt service binding port.
# Datatype: int
# mqtt_port=1883

# the handler pool size for handing the mqtt messages.
# Datatype: int
# mqtt_handler_pool_size=1

# the mqtt message payload formatter.
# Datatype: String
# mqtt_payload_formatter=json

# max length of mqtt message in byte
# Datatype: int
# mqtt_max_message_size=1048576

####################
### IoTDB-ML Configuration
####################

# The thread count which can be used for model inference operation.
# model_inference_execution_thread_count=5

####################
### Load TsFile Configuration
####################

# Load clean up task is used to clean up the unsuccessful loaded tsfile after a certain period of time.
# The parameter is the delay time after an unsuccessful load operation (in seconds).
# load_clean_up_task_execution_delay_time_seconds=1800