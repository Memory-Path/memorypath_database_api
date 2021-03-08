import 'package:hive/hive.dart';

part 'MemoryPoint.g.dart';

@HiveType(typeId: 1)
class MemoryPointDb extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(6)
  String name;
  @HiveField(2)
  String question;
  @HiveField(3)
  String answer;
  @HiveField(4)
  double lat;
  @HiveField(5)
  double long;

  MemoryPointDb(
      {this.id,
      this.image,
      this.question,
      this.answer,
      this.lat,
      this.long,
      this.name});
}
