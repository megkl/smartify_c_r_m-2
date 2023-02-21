import 'dart:async';

import 'package:smartify_c_r_m/model/terms_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TermsDatabaseHelper {
  static final TermsDatabaseHelper _instance =
      TermsDatabaseHelper.internal();

  factory TermsDatabaseHelper() => _instance;

  
  final String tableTerms = 'TermsTable';
  
  final String columnId = 'id';
  final String columnDescription = 'description';
  final String columnUserId = 'userId';

  static Database? _db;

  TermsDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Termss.db');

    //await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableTerms($columnId INTEGER PRIMARY KEY, $columnDescription TEXT, $columnUserId TEXT)');
  }

  Future<Terms> saveTerms(Terms terms) async {
   //var contactValues = {"userId":contact.userId,"fullName":contact.fullName,"jobTitle":contact.jobTitle};
    var dbClient = await db;
     terms.id = await dbClient.insert(tableTerms, terms.toMap());

    return terms;
  }

  Future<List<Terms>> getAllTerms() async {
     var dbClient = await db;
    var res = await dbClient
        .query(tableTerms);
    List<Terms> result = res.map((c) => Terms.fromMap(c)).toList().reversed.toList();
    


    // result.forEach((currentTerms) {
    //   TermsModel contact = TermsModel.fromMap(currentTerms);

    //  contacts.add(contact);
    // });
    return result;
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableTerms'));
  }

  Future<Terms?> getTerms(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableTerms,
        columns: [columnId,columnUserId, columnDescription],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new TermsModel.fromJson(result);
    // }

    return null;
  }

  Future<int> deleteTermsModel(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableTerms, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateTermsModel(Terms terms) async {
    var dbClient = await db;
    return await dbClient.update(tableTerms, terms.toMap(),
        where: "$columnId = ?", whereArgs: [terms.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
