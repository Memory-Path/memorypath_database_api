import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:memorypath_db_api/memorypath_db_api.dart';

main() {
  Hive.init("./");
  Hive.registerAdapter(MemoryPathDbAdapter());
  Hive.registerAdapter(MemoryPointDbAdapter());
  setUp(() async {});
  tearDown(() async {
    await Hive.close();
    await Hive.deleteBoxFromDisk(HIVE_SETTINGS);
    await Hive.deleteBoxFromDisk(HIVE_MEMORY_PATHS);
    await Hive.deleteBoxFromDisk(HIVE_MEMORY_POINTS);
  });
  test("Insert, update and get MemoryPathDb", () async {
    //ARRANGE
    Box memoryPathBox = await Hive.openBox<MemoryPathDb>(HIVE_MEMORY_PATHS);
    HiveList<MemoryPointDb> memoryPoints;
    MemoryPathDb memoryPath = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);

    //ACT
    memoryPathBox.add(memoryPath);
    memoryPath.name = "";

    //ASSET
    MemoryPathDb memoryPathRetrieved = memoryPathBox.getAt(0);
    print(memoryPath.key);
    expect(memoryPathRetrieved.name, memoryPath.name);
  });

  test("Insert, delete and get MemoryPathDb-Objects", () async {
    //ARRANGE
    Box memoryPathBox = await Hive.openBox<MemoryPathDb>(HIVE_MEMORY_PATHS);
    HiveList<MemoryPointDb> memoryPoints;
    MemoryPathDb memoryPath1 = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);
    MemoryPathDb memoryPath2 =
        MemoryPathDb(name: "T", topic: "Chemistry", memoryPoints: memoryPoints);
    MemoryPathDb memoryPath3 = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);

    //ACT
    await memoryPathBox.add(memoryPath1);
    await memoryPathBox.add(memoryPath2);
    await memoryPathBox.add(memoryPath3);
    await memoryPathBox.delete(0);
    await memoryPathBox.delete(1);

    //ASSET
    MemoryPathDb memoryPathRetrieved = memoryPathBox.get(2);
    expect(memoryPathRetrieved.name, memoryPath1.name);
  });

  test("Insert, update on MemoryPathDb-Object and get MemoryPointDb", () async {
    //ARRANGE
    Box memoryPathBox = await Hive.openBox<MemoryPathDb>(HIVE_MEMORY_PATHS);
    Box memoryPointBox = await Hive.openBox<MemoryPointDb>(HIVE_MEMORY_POINTS);
    MemoryPointDb memoryPoint = MemoryPointDb(
        name: "Point1", image: "", question: "", answer: "", lat: 20, long: 30);
    MemoryPointDb memoryPointChanged = MemoryPointDb(
        name: "Point2", image: "", question: "", answer: "", lat: 20, long: 30);
    memoryPointBox.add(memoryPoint);
    memoryPointBox.add(memoryPointChanged);
    HiveList<MemoryPointDb> memoryPoints =
        HiveList(memoryPointBox, objects: [memoryPoint]);
    HiveList<MemoryPointDb> memoryPointsChanged =
        HiveList(memoryPointBox, objects: [memoryPointChanged]);
    MemoryPathDb memoryPath = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);
    memoryPathBox.add(memoryPath);

    //ACT
    memoryPath.memoryPoints = memoryPointsChanged;
    //Alternative directly with MemoryPoint:
    //memoryPath.memoryPoints.remove(memoryPoint);
    //memoryPath.memoryPoints.add(memoryPointChanged);

    //ASSET
    MemoryPathDb memoryPathRetrieved = memoryPathBox.get(0);
    expect(
        memoryPathRetrieved.memoryPoints.first, memoryPath.memoryPoints.first);
  });

  test("Insert and list MemoryPathDb-Objects", () async {
    //ARRANGE
    Box memoryPathBox = await Hive.openBox<MemoryPathDb>(HIVE_MEMORY_PATHS);
    HiveList<MemoryPointDb> memoryPoints;
    MemoryPathDb memoryPath1 = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);
    MemoryPathDb memoryPath2 =
    MemoryPathDb(name: "T", topic: "Chemistry", memoryPoints: memoryPoints);
    MemoryPathDb memoryPath3 = MemoryPathDb(
        name: "The Way", topic: "Chemistry", memoryPoints: memoryPoints);
    List<MemoryPathDb> memoryPaths = List.of([memoryPath1,memoryPath2, memoryPath3]);

    //ACT
    await memoryPathBox.add(memoryPath1);
    await memoryPathBox.add(memoryPath2);
    await memoryPathBox.add(memoryPath3);

    //ASSET
    List<MemoryPathDb> memoryPathRetrieved = [];
    memoryPathRetrieved.addAll(memoryPathBox.values);
    expect(memoryPathRetrieved, memoryPaths);
  });

}
