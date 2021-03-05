import 'package:hive/hive.dart';

import 'MemoryPoint.dart';

part 'MemoryPath.g.dart';

@HiveType(typeId: 0)
class MemoryPathDb {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String topic;
  @HiveField(3)
  final List<MemoryPointDb> memoryPoints;

  MemoryPathDb({this.id, this.name, this.topic, this.memoryPoints});

  /*factory MemoryPath.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathToJson(this);*/
}
