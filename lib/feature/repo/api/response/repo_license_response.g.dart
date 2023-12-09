// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_license_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoLicenseResponse _$RepoLicenseResponseFromJson(Map<String, dynamic> json) =>
    RepoLicenseResponse(
      key: json['key'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      spdxId: json['spdx_id'] as String,
      nodeId: json['node_id'] as String,
    );

Map<String, dynamic> _$RepoLicenseResponseToJson(
        RepoLicenseResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'url': instance.url,
      'spdx_id': instance.spdxId,
      'node_id': instance.nodeId,
    };
