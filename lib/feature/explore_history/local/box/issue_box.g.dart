// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IssueBoxAdapter extends TypeAdapter<IssueBox> {
  @override
  final int typeId = 3;

  @override
  IssueBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IssueBox(
      title: fields[0] as String,
      createdAt: fields[1] as String,
      repoOwnerLoginName: fields[2] as String,
      repoTitle: fields[3] as String,
      labels: (fields[4] as List).cast<LabelBox>(),
      commentCount: fields[5] as int,
      assigneesBox: (fields[6] as List).cast<AssignerBox>(),
      suggesterLoginName: fields[7] as String,
      suggesterProfileImg: fields[8] as String,
      issueContent: fields[9] as String?,
      issueStateTag: fields[10] as String,
      exploreDate: fields[11] as DateTime,
      categoryTag: fields[12] as String,
      nodeId: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IssueBox obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.repoOwnerLoginName)
      ..writeByte(3)
      ..write(obj.repoTitle)
      ..writeByte(4)
      ..write(obj.labels)
      ..writeByte(5)
      ..write(obj.commentCount)
      ..writeByte(6)
      ..write(obj.assigneesBox)
      ..writeByte(7)
      ..write(obj.suggesterLoginName)
      ..writeByte(8)
      ..write(obj.suggesterProfileImg)
      ..writeByte(9)
      ..write(obj.issueContent)
      ..writeByte(10)
      ..write(obj.issueStateTag)
      ..writeByte(11)
      ..write(obj.exploreDate)
      ..writeByte(12)
      ..write(obj.categoryTag)
      ..writeByte(13)
      ..write(obj.nodeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IssueBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
