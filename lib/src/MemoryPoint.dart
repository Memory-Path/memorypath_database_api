import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MemoryPoint.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class MemoryPointDb extends HiveObject {
  @HiveField(0)
  String? image;
  @HiveField(5)
  String? name;
  @HiveField(1)
  String? question;
  @HiveField(2)
  String? answer;
  @HiveField(3)
  double? lat;
  @HiveField(4)
  double? long;

  MemoryPointDb({
    this.image,
    this.question,
    this.answer,
    this.lat,
    this.long,
    this.name,
  });

  factory MemoryPointDb.fromJson(Map<String, dynamic> json) =>
      _$MemoryPointDbFromJson(json);
  Map<String, dynamic> toJson() => _$MemoryPointDbToJson(this);
}
