// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemoryPathFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryPathFile _$MemoryPathFileFromJson(Map<String, dynamic> json) {
  return MemoryPathFile(
    metadata: MemoryPathFileMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>),
    memoryPathData: (json['memoryPathData'] as List<dynamic>)
        .map((e) => MemoryPathDb.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MemoryPathFileToJson(MemoryPathFile instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'memoryPathData': instance.memoryPathData,
    };

MemoryPathFileMetadata _$MemoryPathFileMetadataFromJson(
    Map<String, dynamic> json) {
  return MemoryPathFileMetadata(
    author: json['author'] as String,
    createTime: json['createTime'] as int,
    fileFormatVersion: json['fileFormatVersion'] as int,
  );
}

Map<String, dynamic> _$MemoryPathFileMetadataToJson(
        MemoryPathFileMetadata instance) =>
    <String, dynamic>{
      'author': instance.author,
      'createTime': instance.createTime,
      'fileFormatVersion': instance.fileFormatVersion,
    };
