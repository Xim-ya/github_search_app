// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoBoxAdapter extends TypeAdapter<RepoBox> {
  @override
  final int typeId = 2;

  @override
  RepoBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RepoBox(
      nodeId: fields[0] as String,
      userLoginName: fields[1] as String,
      userProfileImgUrl: fields[2] as String,
      title: fields[3] as String,
      description: fields[4] as String?,
      language: fields[5] as String?,
      starCount: fields[6] as int,
      forkCount: fields[7] as int,
      exploreDate: fields[8] as DateTime,
      categoryTag: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RepoBox obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.nodeId)
      ..writeByte(1)
      ..write(obj.userLoginName)
      ..writeByte(2)
      ..write(obj.userProfileImgUrl)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.starCount)
      ..writeByte(7)
      ..write(obj.forkCount)
      ..writeByte(8)
      ..write(obj.exploreDate)
      ..writeByte(9)
      ..write(obj.categoryTag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
