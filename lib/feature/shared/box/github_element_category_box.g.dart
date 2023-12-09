// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_element_category_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubElementCategoryBoxAdapter
    extends TypeAdapter<GithubElementCategoryBox> {
  @override
  final int typeId = 6;

  @override
  GithubElementCategoryBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubElementCategoryBox(
      fields[0] as GithubElementCategory,
    );
  }

  @override
  void write(BinaryWriter writer, GithubElementCategoryBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubElementCategoryBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
