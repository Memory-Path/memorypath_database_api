import 'package:memorypath_db_api/MemoryPath.dart';

abstract class MemoryPathDatabaseApi {

  Future<MemoryPath> getMemoryPath(int id);
  Future<void> insertMemoryPath(MemoryPath memoryPath);
  Future<void> updateMemoryPath(MemoryPath memoryPath);
  Future<void> deleteMemoryPath(int id);
  Future<List<MemoryPath>> getAllMemoryPaths();
}