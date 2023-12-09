// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserListBoxAdapter extends TypeAdapter<UserListBox> {
  @override
  final int typeId = 1;

  @override
  UserListBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserListBox(
      (fields[0] as List).cast<UserBox>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserListBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
