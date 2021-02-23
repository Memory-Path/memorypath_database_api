import 'package:memorypath_db_api/src/MemoryPathDb.dart';

abstract class MemoryPathDatabaseApi {

  Future<void> initDb({context});
  Future<void> deleteDb();
  Future<MemoryPathDb> getMemoryPath(int id);
  Future<void> insertMemoryPath(MemoryPathDb memoryPath);
  Future<void> updateMemoryPath(MemoryPathDb memoryPath);
  Future<void> deleteMemoryPath(int id);
  Future<List<MemoryPathDb>> listMemoryPaths();

}