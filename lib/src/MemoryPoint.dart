import 'package:hive/hive.dart';

part 'MemoryPoint.g.dart';

@HiveType(typeId: 1)
class MemoryPointDb extends HiveObject {
  @HiveField(0)
  String image;
  @HiveField(5)
  String name;
  @HiveField(1)
  String question;
  @HiveField(2)
  String answer;
  @HiveField(3)
  double lat;
  @HiveField(6)
  double long;

  MemoryPointDb(
      {this.image, this.question, this.answer, this.lat, this.long, this.name});
}
