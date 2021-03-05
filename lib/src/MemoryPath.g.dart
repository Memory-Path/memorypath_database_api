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
      id: fields[0] as int,
      name: fields[1] as String,
      topic: fields[2] as String,
      memoryPoints: (fields[3] as List)?.cast<MemoryPointDb>(),
    );
  }

  @override
  void write(BinaryWriter writer, MemoryPathDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.topic)
      ..writeByte(3)
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
