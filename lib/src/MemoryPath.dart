import 'package:hive/hive.dart';

import 'MemoryPoint.dart';

part 'MemoryPath.g.dart';

@HiveType(typeId: 0)
class MemoryPathDb extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String topic;
  @HiveField(2)
  List<MemoryPointDb> memoryPoints;

  MemoryPathDb({this.name, this.topic, this.memoryPoints});

  /*factory MemoryPath.fromJson(Map<String, dynamic> json) =>
      _$MemoryPathFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPathToJson(this);*/
}
