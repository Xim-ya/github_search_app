// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigner_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssignerBoxAdapter extends TypeAdapter<AssignerBox> {
  @override
  final int typeId = 7;

  @override
  AssignerBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssignerBox(
      login: fields[0] as String,
      id: fields[1] as int,
      nodeId: fields[2] as String,
      avatarUrl: fields[3] as String,
      gravatarId: fields[4] as String,
      url: fields[5] as String,
      htmlUrl: fields[6] as String,
      followersUrl: fields[7] as String,
      followingUrl: fields[8] as String,
      gistsUrl: fields[9] as String,
      starredUrl: fields[10] as String,
      subscriptionsUrl: fields[11] as String,
      organizationsUrl: fields[12] as String,
      reposUrl: fields[13] as String,
      eventsUrl: fields[14] as String,
      receivedEventsUrl: fields[15] as String,
      type: fields[16] as String,
      siteAdmin: fields[17] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AssignerBox obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.login)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.nodeId)
      ..writeByte(3)
      ..write(obj.avatarUrl)
      ..writeByte(4)
      ..write(obj.gravatarId)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.htmlUrl)
      ..writeByte(7)
      ..write(obj.followersUrl)
      ..writeByte(8)
      ..write(obj.followingUrl)
      ..writeByte(9)
      ..write(obj.gistsUrl)
      ..writeByte(10)
      ..write(obj.starredUrl)
      ..writeByte(11)
      ..write(obj.subscriptionsUrl)
      ..writeByte(12)
      ..write(obj.organizationsUrl)
      ..writeByte(13)
      ..write(obj.reposUrl)
      ..writeByte(14)
      ..write(obj.eventsUrl)
      ..writeByte(15)
      ..write(obj.receivedEventsUrl)
      ..writeByte(16)
      ..write(obj.type)
      ..writeByte(17)
      ..write(obj.siteAdmin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignerBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
