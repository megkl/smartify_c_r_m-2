import 'dart:async';

import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:smartify_c_r_m/model/company_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CompanyDatabaseHelper {
  static final CompanyDatabaseHelper _instance =
      CompanyDatabaseHelper.internal();

  factory CompanyDatabaseHelper() => _instance;


  final String tableCompany = 'CompanyTable';
  
  final String columnId = 'id';
  final String columnContactName = 'contactName';
  final String columnCompanyName = 'companyName';
  final String columnPhoneNumber = 'companyPhoneNumber';
  final String columnEmail = 'companyEmail';
  final String columnWebsite = 'companyWebsite';
  final String columnOtherInformation = 'otherInfo';
  final String columnLocation = 'companyLocation';
  final String columnAddress = 'companyAddress';
  final String columnCountry = 'country';
  final String columnUserId = 'userId';
  final String columnPaypal = 'paypal';
  final String columnPhotoUrl = 'photoUrl';
   final String? columnCreatedAt = 'createdAt';
   final String? columnUpdatedAt = 'updatedAt';
 
  static Database? _db;

  CompanyDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'companys.db');

    // String path1 = join(databasesPath, 'products.db');
    // await deleteDatabase(path1); // just for testing
    
    //await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableCompany($columnId INTEGER PRIMARY KEY, $columnCompanyName TEXT,$columnUserId TEXT, $columnAddress TEXT,$columnContactName, TEXT, $columnPhoneNumber TEXT, $columnEmail TEXT, $columnWebsite TEXT,  $columnOtherInformation TEXT, $columnLocation TEXT,$columnCountry TEXT,$columnPaypal TEXT,$columnPhotoUrl TEXT, $columnCreatedAt TEXT,$columnUpdatedAt TEXT)');
  }

  Future<CompanyModel> saveCompany(CompanyModel company) async {
    var dbClient = await db;
     company.id = await dbClient.insert(tableCompany, company.toMap());

    return company;
  }

  Future<List> getAllCompany() async {
     var dbClient = await db;
    var result = await dbClient
        .query(tableCompany);

   List<CompanyModel> companys = [];

    // result.forEach((currentCompany) {
    //   CompanyModel company = CompanyModel.fromMap(currentCompany);

    //  companys.add(company);
    // });
    return result.toList();
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableCompany'));
  }

  Future getCompanyById(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableCompany,
        columns: [columnId,columnUserId, columnCompanyName,columnPhotoUrl, columnPhoneNumber,columnEmail,columnContactName, columnAddress,columnLocation,columnOtherInformation,columnWebsite],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new CompanyModel.fromJson(result);
    // }
    if(result.isEmpty){
      return [];
    }

    return result[0];
  }
  
  Future<CompanyModel> getCompanyByUserId(String userId) async {
    var dbClient = await db;
    var result = await dbClient.query(tableCompany,
        columns: [columnId,columnUserId, columnCompanyName, columnPhoneNumber,columnEmail,columnContactName, columnAddress,columnLocation,columnOtherInformation,columnWebsite],
        where: '$columnUserId = ?',
        whereArgs: [userId]);
    List<CompanyModel> list = result.map((c) => CompanyModel.fromMap(c)).toList().reversed.toList();
    
    if (result.isEmpty) {
    }

    return list[0];
  }

  Future<int> deleteCompanyModel(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableCompany, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateCompanyModel(CompanyModel company) async {
    var dbClient = await db;
     
    var result = await dbClient.update(tableCompany, company.toMap(),
        where: "$columnId = ?", whereArgs: [company.id]);

        return result;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
