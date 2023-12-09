// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pr_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrBoxAdapter extends TypeAdapter<PrBox> {
  @override
  final int typeId = 4;

  @override
  PrBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrBox(
      nodeId: fields[11] as String,
      title: fields[0] as String,
      createdAt: fields[1] as String,
      repoOwnerLoginName: fields[2] as String,
      repoTitle: fields[3] as String,
      labels: (fields[4] as List).cast<LabelBox>(),
      prStateTag: fields[5] as String,
      prContent: fields[6] as String?,
      suggesterLoginName: fields[7] as String,
      suggesterProfileImg: fields[8] as String,
      exploreDate: fields[9] as DateTime,
      categoryTag: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrBox obj) {
    writer
      ..writeByte(12)
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
      ..write(obj.prStateTag)
      ..writeByte(6)
      ..write(obj.prContent)
      ..writeByte(7)
      ..write(obj.suggesterLoginName)
      ..writeByte(8)
      ..write(obj.suggesterProfileImg)
      ..writeByte(9)
      ..write(obj.exploreDate)
      ..writeByte(10)
      ..write(obj.categoryTag)
      ..writeByte(11)
      ..write(obj.nodeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
