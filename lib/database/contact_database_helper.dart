import 'dart:async';

import 'package:smartify_c_r_m/model/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactDatabaseHelper {
  static final ContactDatabaseHelper _instance =
      ContactDatabaseHelper.internal();

  factory ContactDatabaseHelper() => _instance;

  final String tableContact = 'contactTable';
  final String tableCompany = 'companyTable';
  final String tableTeam = 'TeamTable';
  final String tableContactModel = 'ProductTable';
  
  final String columnId = 'id';
  final String columnFullName = 'fullName';
  final String columnJobTitle = 'jobTitle';
  final String columnCompanyName = 'companyName';
  final String columnPhoneNumbers = 'phoneNumbers';
  final String columnEmails = 'emails';
  final String columnWebsite = 'website';
  final String columnOtherInformation = 'otherInfo'; 
  final String columnLocation = 'locationDetails';
  final String columnGroup = 'contactGroup';
  final String columnUserId = 'userId';
   final String? columnCreatedAt = 'createdAt';
   final String? columnUpdatedAt = 'updatedAt';

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

    //await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableContactModel($columnId INTEGER PRIMARY KEY, $columnFullName TEXT,$columnUserId TEXT, $columnJobTitle TEXT,$columnCompanyName, TEXT, $columnPhoneNumbers TEXT, $columnEmails TEXT, $columnWebsite TEXT,  $columnOtherInformation TEXT, $columnLocation TEXT,$columnGroup TEXT,$columnCreatedAt TEXT,$columnUpdatedAt TEXT)');
  }

  Future<ContactModel> saveContact(ContactModel contact) async {
   //var contactValues = {"userId":contact.userId,"fullName":contact.fullName,"jobTitle":contact.jobTitle};
    var dbClient = await db;
     contact.id = await dbClient.insert(tableContactModel, contact.toMap());

    return contact;
  }

  Future<List<ContactModel>> getAllContact() async {
     var dbClient = await db;
    var res = await dbClient
        .query(tableContactModel);

    List<ContactModel> result = res.map((c) => ContactModel.fromMap(c)).toList().reversed.toList();
    

    // result.forEach((currentContact) {
    //   ContactModel contact = ContactModel.fromMap(currentContact);

    //  contacts.add(contact);
    // });
    return result;
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableContactModel'));
  }

  Future<ContactModel?> getContact(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableContactModel,
        columns: [columnId,columnUserId, columnFullName, columnPhoneNumbers,columnEmails,columnGroup,columnJobTitle,columnLocation,columnOtherInformation,columnWebsite],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new ContactModel.fromJson(result);
    // }

    return null;
  }

  Future<int> deleteContactModel(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableContactModel, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateContactModel(ContactModel contact) async {
    var dbClient = await db;
    return await dbClient.update(tableContactModel, contact.toMap(),
        where: "$columnId = ?", whereArgs: [contact.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
