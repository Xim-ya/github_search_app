// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'label_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LabelBoxAdapter extends TypeAdapter<LabelBox> {
  @override
  final int typeId = 6;

  @override
  LabelBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LabelBox(
      name: fields[0] as String,
      color: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LabelBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LabelBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
