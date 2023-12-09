// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_history_collection_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExploreHistoryCollectionBoxAdapter
    extends TypeAdapter<ExploreHistoryCollectionBox> {
  @override
  final int typeId = 5;

  @override
  ExploreHistoryCollectionBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExploreHistoryCollectionBox(
      userList: (fields[0] as List).cast<UserBox>(),
      repoList: (fields[1] as List).cast<RepoBox>(),
      issueList: (fields[2] as List).cast<IssueBox>(),
      prList: (fields[3] as List).cast<PrBox>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExploreHistoryCollectionBox obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userList)
      ..writeByte(1)
      ..write(obj.repoList)
      ..writeByte(2)
      ..write(obj.issueList)
      ..writeByte(3)
      ..write(obj.prList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExploreHistoryCollectionBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
