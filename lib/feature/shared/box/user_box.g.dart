// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserBoxAdapter extends TypeAdapter<UserBox> {
  @override
  final int typeId = 0;

  @override
  UserBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserBox(
      nodeId: fields[0] as String,
      loginName: fields[1] as String,
      profileImgUrl: fields[2] as String,
      bio: fields[3] as String?,
      location: fields[4] as String?,
      followersCount: fields[5] as int,
      followingCount: fields[6] as int,
      exploreDate: fields[7] as DateTime,
      categoryTag: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserBox obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.nodeId)
      ..writeByte(1)
      ..write(obj.loginName)
      ..writeByte(2)
      ..write(obj.profileImgUrl)
      ..writeByte(3)
      ..write(obj.bio)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.followersCount)
      ..writeByte(6)
      ..write(obj.followingCount)
      ..writeByte(7)
      ..write(obj.exploreDate)
      ..writeByte(8)
      ..write(obj.categoryTag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
