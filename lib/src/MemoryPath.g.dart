// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemoryPath.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoryPathDbAdapter extends TypeAdapter<MemoryPathDb> {
  @override
  final int typeId = 0;

  @override
  MemoryPathDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoryPathDb(
      name: fields[0] as String,
      topic: fields[1] as String,
      memoryPoints: (fields[2] as List)?.cast<MemoryPointDb>(),
    );
  }

  @override
  void write(BinaryWriter writer, MemoryPathDb obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.topic)
      ..writeByte(2)
      ..write(obj.memoryPoints);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoryPathDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryPathDb _$MemoryPathDbFromJson(Map<String, dynamic> json) {
  return MemoryPathDb(
    name: json['name'] as String,
    topic: json['topic'] as String,
    memoryPoints: (json['memoryPoints'] as List)
        ?.map((e) => e == null
            ? null
            : MemoryPointDb.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MemoryPathDbToJson(MemoryPathDb instance) =>
    <String, dynamic>{
      'name': instance.name,
      'topic': instance.topic,
      'memoryPoints': instance.memoryPoints,
    };
