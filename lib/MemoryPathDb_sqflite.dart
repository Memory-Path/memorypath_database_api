import 'package:flutter/material.dart';
import 'package:memorypath_db_api/DatabaseError.dart';
import 'package:memorypath_db_api/MemoryPath.dart';
import 'package:memorypath_db_api/MemoryPathDb_api.dart';
import 'package:memorypath_db_api/MemoryPoint.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



class MemoryPathDatabaseSqflite extends MemoryPathDatabaseApi{

  //Database-Config:
  static Database db;
  static const String DB_NAME = 'memorypath.db';
  static const int VERSION = 1;
  //Table Config:
  //MemoryPath-Table
  static const String TABLE_MEMORYPATHS = 'MemoryPaths';
  static const String ID_MEMORYPATH = 'id';
  static const String NAME_MEMORYPATH = 'name';
  static const String TOPIC_MEMORYPATH = 'topic';
  //MemoryPoints-Table
  static const String TABLE_MEMORYPOINTS = 'MemoryPoints';
  static const String ID_MEMORYPOINT = 'id';
  static const String IMAGE_MEMORYPOINT = 'image';
  static const String QUESTION_MEMORYPOINT = 'question';
  static const String ANSWER_MEMORYPOINT = 'answer';
  static const String LAT_MEMORYPOINT = 'lat';
  static const String LONG_MEMORYPOINT = 'long';
  static const String MEMORYPATHID_MEMORYPOINT = 'memorypathid';

  //Initialize a new Database
  // - different operations depending on Platform
  Future<void> initDb({context}) async {
    if (db!=null){
      return;
    }
    if (context==null||Theme.of(context).platform == TargetPlatform.windows||Theme.of(context).platform == TargetPlatform.linux){
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      try {
        db = await databaseFactory.openDatabase(inMemoryDatabasePath);
      } catch (e) {
        throw DatabaseError("Error instantiating Database",e);
      }

    }
    else {
      String path = await getDatabasesPath() + DB_NAME;
      try {
        db = await openDatabase(
          path,
          //Version needed?
          //version: VERSION,
        );
      } catch (e) {
        throw DatabaseError("Error instantiating Database",e);
      }
    }
    try {
      db.execute(
        "CREATE TABLE $TABLE_MEMORYPATHS($ID_MEMORYPATH INTEGER PRIMARY KEY, $NAME_MEMORYPATH TEXT, $TOPIC_MEMORYPATH TEXT); "
            "CREATE TABLE $TABLE_MEMORYPOINTS($ID_MEMORYPOINT INTEGER PRIMARY KEY, $IMAGE_MEMORYPOINT TEXT, $QUESTION_MEMORYPOINT TEXT, $ANSWER_MEMORYPOINT TEXT, $LAT_MEMORYPOINT REAL, $LONG_MEMORYPOINT REAL, $MEMORYPATHID_MEMORYPOINT INTEGER)",
      );
    } catch (e) {
      throw DatabaseError("Error while creating the Tables", e);
    }
    return;
  }

  @override
  Future<void> deleteDb({context}) async {
    try {
      await db.close();
      if (context!=null||Theme.of(context).platform != TargetPlatform.windows||Theme.of(context).platform != TargetPlatform.linux){
        await deleteDatabase(db.path);
      }
      return;
    } catch (e) {
      throw DatabaseError("Error while closing or deleting the Database", e);
    }
  }

  //get MemoryPath from MemoryPath-Table and all its belonging MemoryPoints from MemoryPoints-Table
  @override
  Future<MemoryPath> getMemoryPath(int id) async {
    //Retrieve MemoryPath
    try {
      List<Map<String,dynamic>> memoryPathMap = await db.query(
          TABLE_MEMORYPATHS,
          where: '$ID_MEMORYPATH = ?',
          whereArgs: [id]
      );
      //Retrieve MemoryPoints
      List<Map<String,dynamic>> memoryPointMap = await db.query(TABLE_MEMORYPOINTS,
          where: '$MEMORYPATHID_MEMORYPOINT = ?',
          whereArgs: [id]
      );
      List<MemoryPoint> memoryPoints = List.empty(growable: true);
      memoryPointMap.forEach((memoryPoint) {
        memoryPoints.add(MemoryPoint.fromMap(memoryPoint));
      });
      //build and return MemoryPath
      return MemoryPath.fromMap(memoryPathMap.first, memoryPoints);
    } catch (e) {
      throw DatabaseError("Could not retrieve Memory-Path or its Memory-Points", e);
    }
  }


  //delete MemoryPath from MemoryPath-Table and delete all its belonging MemoryPoints by Id out of MemoryPoint-Table
  @override
  Future<void> deleteMemoryPath(int id) async {
    try{
      await db.delete(
        TABLE_MEMORYPATHS,
        where: "$ID_MEMORYPATH = ?",
        whereArgs: [id],
      );
      await db.delete(
        TABLE_MEMORYPOINTS,
        where: "$MEMORYPATHID_MEMORYPOINT = ?",
        whereArgs: [id],
      );
    } catch (e){
      throw DatabaseError("Error deleting MemoryPath", e);
    }
  }

  //add MemoryPath to MemoryPaths-Table and all its MemoryPoints to the MemoryPoints-Table
  @override
  Future<void> insertMemoryPath(MemoryPath memoryPath) async {
    try{
      await db.insert(TABLE_MEMORYPATHS, memoryPath.toMap());
      memoryPath.memoryPoints.forEach((memoryPoint) async {
        await db.insert(TABLE_MEMORYPOINTS, memoryPoint.toMap(memoryPath.id));
      });
    } catch (e){
      throw DatabaseError("Error inserting MemoryPath", e);
    }
  }

  //delete all data from the old MemoryPath and insert new one
  @override
  Future<void> updateMemoryPath(MemoryPath memoryPath) async {
    try {
      await deleteMemoryPath(memoryPath.id);
      await insertMemoryPath(memoryPath);
    } catch (e) {
      throw DatabaseError("Error updating MemoryPath", e);
    }
  }

  @override
  Future<List<MemoryPath>> listMemoryPaths() async {
    List<MemoryPath> memoryPaths = List.empty(growable: true);
    //Retrieve all MemoryPaths
    try {
      List<Map<String,dynamic>> memoryPathMap = await db.query(TABLE_MEMORYPATHS);
      //Iterate through MemoryPath-List
      memoryPathMap.forEach((memoryPath) async {
        //Retrieve MemoryPoints
        List<Map<String,dynamic>> memoryPointMap = await db.query(TABLE_MEMORYPOINTS,
            where: '$MEMORYPATHID_MEMORYPOINT = ?',
            whereArgs: [memoryPath["$ID_MEMORYPATH"]]
        );
        List<MemoryPoint> memoryPoints = List.empty(growable: true);
        memoryPointMap.forEach((memoryPoint) {
          memoryPoints.add(MemoryPoint.fromMap(memoryPoint));
        });
        //create MemoryPath and add to MemoryPath-List
        memoryPaths.add(MemoryPath.fromMap(memoryPath, memoryPoints));
      });
      return memoryPaths;
    } catch (e) {
      throw DatabaseError("Error retrieving all MemoryPaths", e);
    }
  }
}