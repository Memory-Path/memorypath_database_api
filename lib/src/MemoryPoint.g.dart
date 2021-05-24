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
      image: fields[0] as String,
      question: fields[1] as String,
      answer: fields[2] as String,
      lat: fields[3] as double,
      long: fields[4] as double,
      name: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MemoryPointDb obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryPointDb _$MemoryPointDbFromJson(Map<String, dynamic> json) {
  return MemoryPointDb(
    image: json['image'] as String,
    question: json['question'] as String,
    answer: json['answer'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$MemoryPointDbToJson(MemoryPointDb instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'question': instance.question,
      'answer': instance.answer,
      'lat': instance.lat,
      'long': instance.long,
    };
