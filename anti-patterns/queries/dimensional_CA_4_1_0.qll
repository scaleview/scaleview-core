predicate isDimensional(string fullyQualifiedName) {
  fullyQualifiedName in [
      "org.apache.cassandra.utils.concurrent.LoadingMap.getIfReady",
      "org.apache.cassandra.utils.concurrent.WaitQueue$Standard.cleanUpCancelled",
      "org.apache.cassandra.io.sstable.metadata.CompactionMetadata$CompactionMetadataSerializer.serializedSize",
      "org.apache.cassandra.io.sstable.format.SSTableReader.getApproximateKeyCount",
      "org.apache.cassandra.io.sstable.metadata.CompactionMetadata$CompactionMetadataSerializer.serialize",
      "org.apache.cassandra.db.compaction.AbstractCompactionStrategy$ScannerList.getTotalBytesScanned",
      "org.apache.cassandra.db.ColumnFamilyStore.getBackgroundCompactionTaskSubmitter",
      "org.apache.cassandra.db.compaction.CompactionTask.runMayThrow",
      "org.apache.cassandra.io.sstable.format.big.BigTableReader.getPosition",
      "org.apache.cassandra.db.transform.BasePartitions.hasNext",
      "org.apache.cassandra.io.util.RebufferingInputStream.read",
      "org.apache.cassandra.io.sstable.metadata.CompactionMetadata$CompactionMetadataSerializer.deserialize",
      "org.apache.cassandra.db.transform.BaseRows.runOnClose",
      "org.apache.cassandra.metrics.LatencyMetrics.addNano",
      "org.apache.cassandra.utils.concurrent.LoadingMap.blockingLoadIfAbsent",
      "org.apache.cassandra.io.sstable.SSTableRewriter.append",
      "org.apache.cassandra.locator.DynamicEndpointSnitch.updateScores",
      "org.apache.cassandra.service.StorageService.getLocalPrimaryRangeForEndpoint",
      "org.apache.cassandra.service.StorageService.getPrimaryRangesForEndpoint",
      "org.apache.cassandra.concurrent.SEPWorker.selfAssign",
      "org.apache.cassandra.db.rows.RowIterators.digest",
      "org.apache.cassandra.utils.MergeIterator.close",
      "org.apache.cassandra.metrics.MessagingMetrics.recordInternalLatency",
      "org.apache.cassandra.locator.AbstractReplicaCollection$ReplicaMap.internalPutIfAbsent",
      "org.apache.cassandra.locator.SimpleStrategy.calculateNaturalReplicas",
      "org.apache.cassandra.locator.AbstractReplicationStrategy.getAddressReplicas",
      "org.apache.cassandra.gms.Gossiper.getStateForVersionBiggerThan",
      "org.apache.cassandra.locator.AbstractReplicaCollection$ReplicaMap.get",
      "org.apache.cassandra.gms.GossipDigestAckSerializer.serializedSize",
      "org.apache.cassandra.gms.EndpointStateSerializer.serializedSize",
      "org.apache.cassandra.gms.GossipDigestAckVerbHandler.doVerb",
      "org.apache.cassandra.gms.Gossiper.examineShadowState",
      "org.apache.cassandra.gms.Gossiper.notifyFailureDetector",
      "org.apache.cassandra.gms.Gossiper.isUpgradingFromVersionLowerThanC17653",
      "org.apache.cassandra.gms.GossipDigestAckSerializer.serialize",
      "org.apache.cassandra.gms.Gossiper.sendGossip",
      "org.apache.cassandra.utils.SortedBiMultiValMap.create",
      "org.apache.cassandra.locator.RangesByEndpoint$Builder.build",
      "org.apache.cassandra.gms.Gossiper.getGossipStatus",
      "org.apache.cassandra.locator.TokenMetadata.getPrimaryRangesFor",
      "org.apache.cassandra.gms.GossipDigestAck2Serializer.serializedSize",
      "org.apache.cassandra.gms.Gossiper.applyNewStates",
      "org.apache.cassandra.net.EndpointMessagingVersions.set",
      "org.apache.cassandra.utils.CassandraVersion.parseIdentifiers",
      "org.apache.cassandra.gms.Gossiper.makeRandomGossipDigest",
      "org.apache.cassandra.gms.EndpointStateSerializer.serialize",
      "org.apache.cassandra.gms.Gossiper.applyStateLocally",
      "org.apache.cassandra.gms.GossipDigestAckSerializer.deserialize",
      "org.apache.cassandra.gms.GossipDigestAck2Serializer.deserialize",
      "org.apache.cassandra.locator.TokenMetadata.cloneOnlyTokenMap",
      "org.apache.cassandra.gms.Gossiper.getMaxEndpointStateVersion",
      "org.apache.cassandra.gms.ArrivalWindow.add",
      "org.apache.cassandra.db.ClusteringComparator.compare",
      "org.apache.cassandra.gms.GossipDigestSerializationHelper.serializedSize",
      "org.apache.cassandra.utils.CassandraVersion.compareIdentifiers",
      "org.apache.cassandra.gms.Gossiper.getLiveMembers",
      "org.apache.cassandra.gms.GossipDigestSerializationHelper.deserialize",
      "org.apache.cassandra.gms.GossipDigestAck2Serializer.serialize",
      "org.apache.cassandra.metrics.RestorableMeter.tickIfNecessary",
      "org.apache.cassandra.service.StorageService.getAllRanges",
      "org.apache.cassandra.gms.GossipDigestSerializationHelper.serialize",
      "org.apache.cassandra.utils.memory.BufferPool$LocalPool.tryGet",
      "org.apache.cassandra.locator.TokenMetadata.updateEndpointToHostIdMap",
      "org.apache.cassandra.metrics.StreamingMetrics.get",
      "org.apache.cassandra.utils.FastByteOperations$UnsafeOperations.compareTo",
      "org.apache.cassandra.utils.btree.BTree$LeafOrBranchBuilder.areIdentical",
      "org.apache.cassandra.db.SystemKeyspace.updateSizeEstimates",
      "org.apache.cassandra.metrics.DecayingEstimatedHistogramReservoir$AbstractSnapshot.count",
      "org.apache.cassandra.io.sstable.format.SSTableReader$InstanceTidier$1.run",
      "org.apache.cassandra.metrics.DecayingEstimatedHistogramReservoir.bucketValue",
      "org.apache.cassandra.io.sstable.format.SSTableReader$GlobalTidy$1.run",
      "org.apache.cassandra.utils.streamhist.StreamingTombstoneHistogramBuilder$DataHolder.addValue",
      "org.apache.cassandra.cql3.QueryProcessor.makeInternalOptionsWithNowInSec",
      "org.apache.cassandra.db.Keyspace.snapshot",
      "org.apache.cassandra.db.Keyspace.snapshotExists",
      "org.apache.cassandra.transport.CBUtil.writeValue",
      "org.apache.cassandra.db.SizeEstimatesRecorder.run",
      "org.apache.cassandra.db.SizeEstimatesRecorder.computeSizeEstimates",
      "org.apache.cassandra.db.compaction.CompactionManager.submitBackground",
      "org.apache.cassandra.schema.Schema.getNumberOfTables",
      "org.apache.cassandra.cql3.statements.ModificationStatement.executeInternalWithoutCondition",
      "org.apache.cassandra.utils.streamhist.StreamingTombstoneHistogramBuilder$DataHolder.forEach",
      "org.apache.cassandra.db.SystemKeyspace.updateTableEstimates",
      "org.apache.cassandra.db.ColumnFamilyStore.snapshotWithoutMemtable",
      "org.apache.cassandra.db.memtable.SkipListMemtable.getFlushSet",
      "org.apache.cassandra.transport.Flusher.poll",
      "org.apache.cassandra.concurrent.SEPWorker.run",
      "org.apache.cassandra.service.AbstractWriteResponseHandler.signal",
      "org.apache.cassandra.db.Keyspace.applyInternal",
      "org.apache.cassandra.concurrent.SEPExecutor.takeTaskPermit",
      "org.apache.cassandra.gms.Gossiper$GossipTask.run",
      "org.apache.cassandra.db.commitlog.AbstractCommitLogService$SyncRunnable.run",
      "org.apache.cassandra.cache.InstrumentingCache.get",
      "org.apache.cassandra.service.StorageProxy.fetchRows",
      "org.apache.cassandra.service.reads.range.RangeCommandIterator.close",
      "org.apache.cassandra.service.StorageProxy.readRegular",
      "org.apache.cassandra.metrics.MessagingMetrics.resetAndConsumeDroppedErrors",
      "org.apache.cassandra.utils.concurrent.AsyncFuture.trySet",
      "org.apache.cassandra.db.compaction.CompactionManager$BackgroundCompactionCandidate.run",
      "org.apache.cassandra.db.compaction.CompactionStrategyManager.getNextBackgroundTask",
      "org.apache.cassandra.io.util.UnbufferedDataOutputStreamPlus.writeUTF",
      "org.apache.cassandra.serializers.SetSerializer.serializeValues",
      "org.apache.cassandra.db.SystemKeyspace.tokensAsSet",
      "org.apache.cassandra.db.rows.BTreeRow$Builder$CellResolver.resolve",
      "org.apache.cassandra.db.rows.BTreeRow$Builder.addCell",
      "org.apache.cassandra.locator.TokenMetadata.calculatePendingRanges",
      "org.apache.cassandra.utils.btree.BTree$Builder.sort",
      "org.apache.cassandra.db.TypeSizes.encodedUTF8Length",
      "org.apache.cassandra.utils.btree.BTree.accumulateLeaf",
      "org.apache.cassandra.utils.btree.BTree.transformLeaf",
      "org.apache.cassandra.db.rows.Cell$Serializer.serializedSize",
      "org.apache.cassandra.utils.btree.BTree$Builder.resolve",
      "org.apache.cassandra.gms.TokenSerializer.deserialize",
      "org.apache.cassandra.locator.TokenMetadata.addBootstrapTokens",
      "org.apache.cassandra.serializers.SetSerializer.deserializeForNativeProtocol",
      "org.apache.cassandra.db.rows.Cell$Serializer.serialize",
      "org.apache.cassandra.serializers.CollectionSerializer.pack",
      "org.apache.cassandra.service.StorageService.updateTokenMetadata",
      "org.apache.cassandra.db.rows.ComplexColumnData.dataSize",
      "org.apache.cassandra.utils.BiMultiValMap.removeValue",
      "org.apache.cassandra.db.rows.UnfilteredSerializer.sizeOfComplexColumn",
      "org.apache.cassandra.locator.TokenMetadata.updateNormalTokens",
      "org.apache.cassandra.db.rows.ComplexColumnData.unsharedHeapSizeExcludingData",
      "org.apache.cassandra.db.rows.CellPath.dataSize",
      "org.apache.cassandra.cql3.Sets$Value.fromSerialized",
      "org.apache.cassandra.db.rows.UnfilteredSerializer.writeComplexColumn",
      "org.apache.cassandra.utils.btree.BTree.sizesToSizeMap",
      "org.apache.cassandra.utils.concurrent.Ref$GlobalState.release",
      "org.apache.cassandra.io.util.Memory.checkBounds",
      "org.apache.cassandra.gms.Gossiper.addLocalApplicationStates",
      "org.apache.cassandra.utils.btree.BTree.accumulate",
      "org.apache.cassandra.utils.btree.BTree.transform",
      "org.apache.cassandra.cql3.statements.ModificationStatement.validate",
      "org.apache.cassandra.locator.AbstractReplicaCollection.filter",
      "org.apache.cassandra.utils.btree.LeafBTreeSearchIterator.next",
      "org.apache.cassandra.db.rows.Cell$Serializer.deserialize",
      "org.apache.cassandra.transport.messages.BatchMessage.execute",
      "org.apache.cassandra.batchlog.BatchlogManager.store",
      "org.apache.cassandra.cql3.statements.SingleTableUpdatesCollector.toMutations",
      "org.apache.cassandra.cql3.statements.BatchStatement.getMutations",
      "org.apache.cassandra.db.Mutation$MutationSerializer.serializedSize",
      "org.apache.cassandra.db.rows.Row$Merger$ColumnDataReducer.getReduced",
      "org.apache.cassandra.cql3.statements.ModificationStatement.buildPartitionKeyNames",
      "org.apache.cassandra.cql3.statements.ModificationStatement.addUpdates",
      "org.apache.cassandra.db.RegularAndStaticColumns$Builder.addAll",
      "org.apache.cassandra.metrics.DecayingEstimatedHistogramReservoir.findIndex",
      "org.apache.cassandra.triggers.TriggerExecutor.execute",
      "org.apache.cassandra.cql3.statements.BatchStatement.validate",
      "org.apache.cassandra.db.marshal.AbstractTimeUUIDType.compareCustom",
      "org.apache.cassandra.db.rows.BTreeRow.minDeletionTime",
      "org.apache.cassandra.db.Mutation$MutationSerializer.serialize",
      "org.apache.cassandra.cql3.ReservedKeywords.isReserved",
      "org.apache.cassandra.service.StorageProxy.updateCoordinatorWriteLatencyTableMetric",
      "org.apache.cassandra.locator.AbstractReplicationStrategy$ReplicaCache.get",
      "org.apache.cassandra.locator.TokenMetadata.firstTokenIndex",
      "org.apache.cassandra.db.rows.EncodingStats$Collector.get",
      "org.apache.cassandra.db.rows.UnfilteredSerializer.readComplexColumn",
      "org.apache.cassandra.transport.messages.BatchMessage$1.decode",
      "org.apache.cassandra.db.ConsistencyLevel.blockForWrite",
      "org.apache.cassandra.db.Mutation$MutationSerializer.deserialize",
      "org.apache.cassandra.db.SimpleBuilders$RowBuilder.add",
      "org.apache.cassandra.cql3.statements.BatchStatement.authorize",
      "org.apache.cassandra.locator.ReplicaPlans.assureSufficientLiveReplicas",
      "org.apache.cassandra.utils.btree.LeafBTreeSearchIterator.rewind",
      "org.apache.cassandra.cql3.statements.ModificationStatement.authorize",
      "org.apache.cassandra.utils.TimeUUID.toBytes",
      "org.apache.cassandra.db.compaction.ActiveCompactions.finishCompaction",
      "org.apache.cassandra.utils.concurrent.OpOrder$Group.unlink",
      "org.apache.cassandra.schema.MigrationCoordinator.pullUnreceivedSchemaVersions",
      "org.apache.cassandra.schema.Schema.getTableMetadata",
      "org.apache.cassandra.utils.MonotonicClock$AbstractEpochSamplingClock.updateAlmostSameTime",
      "org.apache.cassandra.cql3.statements.SelectStatement.getQuery",
      "org.apache.cassandra.batchlog.BatchlogManager.setRate",
      "org.apache.cassandra.net.OutboundConnection$EventLoopDelivery.doRun",
      "org.apache.cassandra.gms.Gossiper.convict",
      "org.apache.cassandra.service.PendingRangeCalculatorService.new",
      "org.apache.cassandra.gms.Gossiper.markDead",
      "org.apache.cassandra.schema.Tables.containsTable",
      "org.apache.cassandra.db.ClusteringPrefix$Deserializer.prepare",
      "org.apache.cassandra.db.rows.UnfilteredSerializer.serialize",
      "org.apache.cassandra.schema.Tables.filter",
      "org.apache.cassandra.db.ClusteringPrefix$Deserializer.skipNext",
      "org.apache.cassandra.schema.TableMetadata.compareColumns",
      "org.apache.cassandra.db.ClusteringPrefix$Deserializer.compareNextTo",
      "org.apache.cassandra.schema.Tables.getNullable",
      "org.apache.cassandra.service.StorageProxy.syncWriteBatchedMutations",
      "org.apache.cassandra.cql3.statements.BatchStatement.execute",
      "org.apache.cassandra.locator.Replicas.temporaryAssertFull",
      "org.apache.cassandra.service.StorageProxy.sendToHintedReplicas",
      "org.apache.cassandra.utils.btree.BTree.buildMaximallyDense",
      "org.apache.cassandra.service.StorageProxy.mutateAtomically",
      "org.apache.cassandra.db.rows.ComplexColumnData.filter",
      "org.apache.cassandra.utils.btree.BTree$AbstractTransformer.apply",
      "org.apache.cassandra.metrics.ClientMetrics.markRequestDispatched",
      "org.apache.cassandra.concurrent.SEPExecutor.takeWorkPermit",
      "org.apache.cassandra.db.transform.BaseRows.hasNext",
      "org.apache.cassandra.db.ColumnIndex.add",
      "org.apache.cassandra.db.ColumnIndex.buildRowIndex",
      "org.apache.cassandra.db.Keyspace.getValidColumnFamilies",
      "org.apache.cassandra.schema.CompactionParams.equals",
      "org.apache.cassandra.db.repair.PendingAntiCompaction.run",
      "org.apache.cassandra.repair.consistent.LocalSessions.cleanup",
      "org.apache.cassandra.db.compaction.CompactionStrategyManager.getEstimatedRemainingTasks",
      "org.apache.cassandra.service.ActiveRepairService$ParentRepairSession.getTableIds",
      "org.apache.cassandra.metrics.CompactionMetrics$1.getValue",
      "org.apache.cassandra.utils.MerkleTrees.tryMoveOffHeap",
      "org.apache.cassandra.db.repair.PendingAntiCompaction$AcquisitionCallback.apply",
      "org.apache.cassandra.repair.consistent.LocalSessions.maybeUpdateRepairedState",
      "org.apache.cassandra.db.ColumnFamilyStore.forceFlush",
      "org.apache.cassandra.service.ActiveRepairService.prepareForRepair",
      "org.apache.cassandra.metrics.TableMetrics$TableTimer$Context.close",
      "org.apache.cassandra.db.partitions.PartitionUpdate$PartitionUpdateSerializer.deserialize",
      "org.apache.cassandra.schema.ColumnMetadata.comparisonOrder",
      "org.apache.cassandra.cql3.Sets$DelayedValue.bind",
      "org.apache.cassandra.repair.messages.PrepareMessage$1.serialize",
      "org.apache.cassandra.utils.concurrent.FutureCombiner.successfulOf",
      "org.apache.cassandra.cql3.Sets$Literal.prepare",
      "org.apache.cassandra.repair.RepairRunnable.runMayThrow",
      "org.apache.cassandra.schema.CQLTypeParser.parse",
      "org.apache.cassandra.schema.SchemaKeyspace.createTableParamsFromRow",
      "org.apache.cassandra.cql3.Sets$Literal.validateAssignableTo",
      "org.apache.cassandra.dht.Murmur3Partitioner.midpoint",
      "org.apache.cassandra.repair.consistent.LocalSessions.getRepairedState",
      "org.apache.cassandra.repair.RepairRunnable.prepare",
      "org.apache.cassandra.schema.SystemDistributedKeyspace.startParentRepair",
      "org.apache.cassandra.concurrent.SEPWorker.assign",
      "org.apache.cassandra.utils.concurrent.FutureCombiner.allOf",
      "org.apache.cassandra.schema.SystemDistributedKeyspace.startRepairs",
      "org.apache.cassandra.repair.messages.PrepareMessage$1.serializedSize",
      "org.apache.cassandra.repair.consistent.RepairedState.addAll",
      "org.apache.cassandra.cql3.Cql_Parser.setLiteral",
      "org.apache.cassandra.utils.MerkleTree$OffHeapInner.deserializeWithoutIdent",
      "org.apache.cassandra.service.ActiveRepairService.register",
      "org.apache.cassandra.repair.Validator.run", 
      "org.apache.cassandra.repair.Validator.add",
      "org.apache.cassandra.service.ActiveRepairService$ParentRepairSession.getColumnFamilyStores",
      "org.apache.cassandra.utils.MerkleTree.histogramOfRowSizePerLeaf",
      "org.apache.cassandra.batchlog.Batch$Serializer.readEncodedMutations",
      "org.apache.cassandra.utils.concurrent.WaitQueue$Standard.register",
      "org.apache.cassandra.dht.Range.normalize",
      "org.apache.cassandra.repair.ValidationManager.doValidation",
      "org.apache.cassandra.concurrent.NamedThreadFactory.setupThread",
      "org.apache.cassandra.utils.MerkleTree$OnHeapInner.serializeOffHeap",
      "org.apache.cassandra.repair.consistent.LocalSessions.putSession",
      "org.apache.cassandra.cql3.ColumnIdentifier.prefixComparison",
      "org.apache.cassandra.utils.MerkleTree.histogramOfRowCountPerLeaf",
      "org.apache.cassandra.utils.UUIDGen.decompose",
      "org.apache.cassandra.repair.RepairSession.start",
      "org.apache.cassandra.repair.consistent.LocalSessions.tableIdToUuid",
      "org.apache.cassandra.repair.RepairRunnable.complete",
      "org.apache.cassandra.db.marshal.SetType.getInstance",
      "org.apache.cassandra.repair.consistent.LocalSessions.sessionCompleted",
      "org.apache.cassandra.utils.btree.BTree.transformAndFilterLeaf",
      "org.apache.cassandra.schema.SchemaKeyspace.fetchTables",
      "org.apache.cassandra.concurrent.SEPExecutor.addTask",
      "org.apache.cassandra.db.memtable.Flushing$FlushRunnable.writeSortedContents",
      "org.apache.cassandra.net.Crc.crc24",
      "org.apache.cassandra.io.sstable.format.big.BigTableWriter.beforeAppend",
      "org.apache.cassandra.db.marshal.UUIDType.compareCustom",
      "org.apache.cassandra.net.Verb.fromId",
      "org.apache.cassandra.utils.vint.VIntCoding.getUnsignedVInt",
      "org.apache.cassandra.db.partitions.AbstractBTreePartition.sliceIterator",
      "org.apache.cassandra.net.Message$Serializer.extractParams",
      "org.apache.cassandra.net.Message$Serializer.inferMessageSize"
    ]
}