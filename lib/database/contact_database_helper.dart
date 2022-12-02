import 'dart:async';

import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactDatabaseHelper {
  static final ContactDatabaseHelper _instance =
      ContactDatabaseHelper.internal();

  factory ContactDatabaseHelper() => _instance;

  final String tableContact = 'contactTable';
  final String columnId = 'id';
  final String columnFullName = 'fullName';
  final String columnJobTitle = 'jobTitle';
  final String columnPhoneNumbers = 'phoneNumbers';
  final String columnEmails = 'emails';
  final String columnWebsite = 'website';
  final String columnAddress = 'address';
  final String columnOtherInformation = 'otherInfo';
  final String columnLocation = 'location';
  final String columnGroup = 'group';
  final String columnUserId = 'userId';

  static Database? _db;

  ContactDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contacts.db');

    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableContact($columnId INTEGER PRIMARY KEY, $columnFullName TEXT,$columnUserId TEXT, $columnJobTitle TEXT, $columnPhoneNumbers TEXT, $columnEmails TEXT, $columnWebsite TEXT, $columnAddress TEXT, $columnOtherInformation TEXT, $columnLocation TEXT)');
        
  }

  Future<int> saveContact(Contact contact) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableContact, contact.toMap());

    return result;
  }

  Future<List> getAllContacts() async {
    var dbClient = await db;
    var result = await dbClient
        .query(tableContact, columns: [columnId, columnUserId, columnFullName, columnAddress, columnPhoneNumbers,columnEmails,columnGroup,columnJobTitle,columnLocation,columnOtherInformation,columnWebsite]);

    return result.toList();
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableContact'));
  }

  Future<Contact?> getContact(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableContact,
        columns: [columnId,columnUserId, columnFullName, columnAddress, columnPhoneNumbers,columnEmails,columnGroup,columnJobTitle,columnLocation,columnOtherInformation,columnWebsite],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (result.length > 0) {
      return new Contact.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteContact(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableContact, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    var dbClient = await db;
    return await dbClient.update(tableContact, contact.toMap(),
        where: "$columnId = ?", whereArgs: [contact.identifier]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
