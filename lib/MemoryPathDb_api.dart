import 'package:memorypath_db_api/MemoryPath.dart';

abstract class MemoryPathDatabaseApi {

  Future<void> initDb({context});
  Future<void> deleteDb();
  Future<MemoryPath> getMemoryPath(int id);
  Future<void> insertMemoryPath(MemoryPath memoryPath);
  Future<void> updateMemoryPath(MemoryPath memoryPath);
  Future<void> deleteMemoryPath(int id);
  Future<List<MemoryPath>> listMemoryPaths();

}