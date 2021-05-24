import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'MemoryPoint.dart';

part 'MemoryPath.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class MemoryPathDb extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String topic;
  @HiveField(2)
  List<MemoryPointDb> memoryPoints;

  MemoryPathDb({
    this.name,
    this.topic,
    this.memoryPoints,
  });

  factory MemoryPathDb.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathDbFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathDbToJson(this);
}
