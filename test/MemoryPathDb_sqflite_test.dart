import 'package:flutter_test/flutter_test.dart';
import 'package:memorypath_db_api/src/MemoryPathDb.dart';
import 'package:memorypath_db_api/MemoryPathDb_sqflite.dart';
import 'package:memorypath_db_api/src/MemoryPointDb.dart';

main(){
  MemoryPathDatabaseSqflite databaseSqflite;
  setUp(() async {
    databaseSqflite = new MemoryPathDatabaseSqflite();
    await databaseSqflite.initDb();
  });
  tearDown(() async {
    await databaseSqflite.deleteDb();
    databaseSqflite = null;
  });
  test("Insert and get a MemoryPath without MemoryPoints",() async {
    //arrange
    List<MemoryPointDb> memoryPoints = List.empty();
    MemoryPathDb memoryPath = MemoryPathDb(id: 1, name: "The Way to School", topic: "Biology", memoryPoints: memoryPoints);
    //act
    await databaseSqflite.insertMemoryPath(memoryPath);
    //assert
    MemoryPathDb memoryPathExpected = await databaseSqflite.getMemoryPath(memoryPath.id);
    expect(memoryPathExpected.id, memoryPath.id);
    expect(memoryPathExpected.name, memoryPath.name);
    expect(memoryPathExpected.topic, memoryPath.topic);
  });
  test("Insert and get a MemoryPath with 1 MemoryPoint",() async {
    //arrange
    MemoryPointDb memoryPoint = MemoryPointDb(id:1, image:"/xy", question:"What do you want to do?", answer:"Testing!", lat:1.00, long:1.00);
    List<MemoryPointDb> memoryPoints = List.filled(1,memoryPoint);
    MemoryPathDb memoryPath = MemoryPathDb(id: 1, name: "The Way to School", topic: "Biology", memoryPoints: memoryPoints);
    //act
    await databaseSqflite.insertMemoryPath(memoryPath);
    //assert
    MemoryPathDb memoryPathExpected = await databaseSqflite.getMemoryPath(memoryPath.id);
    expect(memoryPathExpected.id, memoryPath.id);
    expect(memoryPathExpected.name, memoryPath.name);
    expect(memoryPathExpected.topic, memoryPath.topic);
    expect(memoryPathExpected.memoryPoints.first.id, memoryPath.memoryPoints.first.id);
    expect(memoryPathExpected.memoryPoints.first.image, memoryPath.memoryPoints.first.image);
    expect(memoryPathExpected.memoryPoints.first.question, memoryPath.memoryPoints.first.question);
    expect(memoryPathExpected.memoryPoints.first.answer, memoryPath.memoryPoints.first.answer);
    expect(memoryPathExpected.memoryPoints.first.lat, memoryPath.memoryPoints.first.lat);
    expect(memoryPathExpected.memoryPoints.first.long, memoryPath.memoryPoints.first.long);
  });
  test("Insert, update and get a MemoryPath without MemoryPoints",() async {
    //arrange
    List<MemoryPointDb> memoryPoints = List.empty();
    MemoryPathDb memoryPath = MemoryPathDb(id: 1, name: "The Way to School", topic: "Biology", memoryPoints: memoryPoints);
    MemoryPathDb memoryPathUpdated = MemoryPathDb(id: 1, name: "London", topic: "Chemistry", memoryPoints: memoryPoints);
    //act
    await databaseSqflite.insertMemoryPath(memoryPath);
    await databaseSqflite.updateMemoryPath(memoryPathUpdated);
    //assert
    MemoryPathDb memoryPathExpected = await databaseSqflite.getMemoryPath(memoryPath.id);
    expect(memoryPathExpected.id, memoryPathUpdated.id);
    expect(memoryPathExpected.name, memoryPathUpdated.name);
    expect(memoryPathExpected.topic, memoryPathUpdated.topic);
  });
}