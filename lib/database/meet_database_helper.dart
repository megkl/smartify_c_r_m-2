import 'dart:async';

import 'package:smartify_c_r_m/model/event_info_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MeetingsDatabaseHelper {
  static final MeetingsDatabaseHelper _instance =
      MeetingsDatabaseHelper.internal();

  factory MeetingsDatabaseHelper() => _instance;


  final String tableMeetings = 'MeetingsTable';
  
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnDescription = 'desc';
  final String columnLocation= 'loc';
  final String columnLink = 'link';
  final String columnAttendeesEmails = 'emails';
  final String columnHasConferencing = 'has_conferencing';
  final String columnShouldNotify = 'should_notify';
  final String columnStart = 'start';
  final String columnEnd = 'end';
  final String columnUserId = 'userId';
   final String? columnCreatedAt = 'createdAt';
   final String columnDate = 'date';
   final String? columnUpdatedAt = 'updatedAt';


  static Database? _db;

  MeetingsDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'events.db');

    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableMeetings($columnId INTEGER PRIMARY KEY, $columnName TEXT,$columnUserId TEXT, $columnDescription TEXT,$columnLocation, TEXT, $columnLink TEXT, $columnHasConferencing TEXT, $columnAttendeesEmails TEXT,  $columnStart TEXT, $columnEnd TEXT, $columnDate TEXT,$columnShouldNotify TEXT, $columnCreatedAt TEXT,$columnUpdatedAt TEXT)');
  }

  Future<EventInfo> saveMeetings(EventInfo event) async {
    var dbClient = await db;
    event.id = await dbClient.insert(tableMeetings, event.toMap());

    return event;
  }

  Future<List> getAllMeetings() async {
     var dbClient = await db;
    var result = await dbClient
        .query(tableMeetings);

   List<EventInfo> events = [];

    // result.forEach((currentMeetings) {
    //   EventInfo event = EventInfo.fromMap(currentMeetings);

    //  events.add(event);
    // });
    return result.toList();
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableMeetings'));
  }

  Future getMeetingsById(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableMeetings,
        columns: [columnId,columnUserId, columnName,columnShouldNotify, columnDescription,columnAttendeesEmails,columnLink, columnLocation,columnLocation,columnStart,columnEnd, columnHasConferencing,columnDate],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new EventInfo.fromJson(result);
    // }
    if(result.isEmpty){
      return [];
    }

    return result[0];
  }
  Future<Map> getMeetingsByUserId(String userId) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableMeetings,
        columns: [columnId,columnUserId, columnName,columnShouldNotify, columnDescription,columnAttendeesEmails,columnLink, columnLocation,columnLocation,columnStart,columnEnd, columnHasConferencing, columnDate],
        where: '$columnUserId = ?',
        whereArgs: [userId]);

    // if (result.length > 0) {
    //   return new EventInfo.fromJson(result);
    // }

    return result[0];
  }

  Future<int> deleteEventInfo(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableMeetings, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateEventInfo(EventInfo event) async {
    var dbClient = await db;
    return await dbClient.update(tableMeetings, event.toMap(),
        where: "$columnId = ?", whereArgs: [event.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
