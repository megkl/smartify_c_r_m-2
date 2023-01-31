import 'dart:async';

import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TeamDatabaseHelper {
  static final TeamDatabaseHelper _instance =
      TeamDatabaseHelper.internal();

  factory TeamDatabaseHelper() => _instance;

  
  final String tableTeam = 'TeamTable';
  
  final String columnId = 'id';
  final String columnFullName = 'fullName';
  final String columnJobTitle = 'jobTitle';
  final String columnCompanyName = 'companyName';
  final String columnPhoneNumber = 'phoneNumbers';
  final String columnEmail = 'emails';
  final String columnWebsite = 'website';
  final String columnOtherInformation = 'otherInfo';
  final String columnLocation = 'locationDetails';
  final String columnUserId = 'userId';
   final String? columnCreatedAt = 'createdAt';
   final String? columnUpdatedAt = 'updatedAt';
  final String columnGroup = 'contactGroup';

  static Database? _db;

  TeamDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'teams.db');

    //await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableTeam($columnId INTEGER PRIMARY KEY, $columnFullName TEXT,$columnUserId TEXT, $columnJobTitle TEXT,$columnCompanyName, TEXT, $columnPhoneNumber TEXT, $columnEmail TEXT,$columnGroup TEXT, $columnWebsite TEXT,  $columnOtherInformation TEXT, $columnLocation TEXT,$columnCreatedAt TEXT,$columnUpdatedAt TEXT)');
  }

  Future<ContactModel> saveTeam(ContactModel contact) async {
   //var contactValues = {"userId":contact.userId,"fullName":contact.fullName,"jobTitle":contact.jobTitle};
    var dbClient = await db;
     contact.id = await dbClient.insert(tableTeam, contact.toMap());

    return contact;
  }

  Future<List> getAllTeam() async {
     var dbClient = await db;
    var result = await dbClient
        .query(tableTeam);

   List<ContactModel> team = [];

    // result.forEach((currentTeam) {
    //   TeamModel contact = TeamModel.fromMap(currentTeam);

    //  contacts.add(contact);
    // });
    return result.toList();
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableTeam'));
  }

  Future<ContactModel?> getTeam(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableTeam,
        columns: [columnId,columnUserId, columnFullName, columnPhoneNumber,columnGroup,columnEmail,columnJobTitle,columnLocation,columnOtherInformation,columnWebsite],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new TeamModel.fromJson(result);
    // }

    return null;
  }

  Future<int> deleteTeamModel(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableTeam, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateTeamModel(ContactModel contact) async {
    var dbClient = await db;
    return await dbClient.update(tableTeam, contact.toMap(),
        where: "$columnId = ?", whereArgs: [contact.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
