// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemoryPoint.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoryPointDbAdapter extends TypeAdapter<MemoryPointDb> {
  @override
  final int typeId = 1;

  @override
  MemoryPointDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoryPointDb(
      id: fields[0] as int,
      image: fields[1] as String,
      question: fields[2] as String,
      answer: fields[3] as String,
      lat: fields[4] as double,
      long: fields[5] as double,
      name: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MemoryPointDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.answer)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoryPointDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
