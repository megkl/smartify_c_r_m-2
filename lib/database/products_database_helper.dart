import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/invoice_model.dart';

class ProductDatabaseHelper {
  static final ProductDatabaseHelper _instance =
      ProductDatabaseHelper.internal();

  factory ProductDatabaseHelper() => _instance;

 
  final String tableProduct = 'ProductTable';
  
  final String columnId = 'id';
  final String columnUserId = 'userId';
  final String columnDescription = 'description';
  //final String columnDate = 'date';
  final String columnQuantity = 'quantity';
  final String columnVat = 'vat';
  final String columnDiscount = 'discount';
  final String columnDate = 'date';
   final String columnUnitPrice = 'unitPrice';
   final String? columnCreatedAt = 'createdAt';
   final String? columnUpdatedAt = 'updatedAt';
   final String columnInvoiceId = 'invoiceId';

  static Database? _db;

  ProductDatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'products.db');

    //await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableProduct($columnId INTEGER PRIMARY KEY, $columnDescription TEXT, $columnUserId TEXT,$columnInvoiceId INTEGER, $columnQuantity INTEGER,$columnVat REAL, $columnDiscount REAL, $columnUnitPrice REAL,$columnDate TEXT,$columnCreatedAt TEXT,$columnUpdatedAt TEXT)');
  }

  Future<InvoiceItem> saveProduct(InvoiceItem product) async {
   //var productValues = {"userId":product.userId,"fullName":product.fullName,"jobTitle":product.jobTitle};
    var dbClient = await db;
     product.id= await dbClient.insert(tableProduct, product.toMap());

    return product;
  }

  Future<List<InvoiceItem>> getAllProduct() async {
     var dbClient = await db;
    var res = await dbClient
        .query(tableProduct);

    List<InvoiceItem> result = res.map((c) => InvoiceItem.fromMap(c)).toList().reversed.toList();
    
    // result.forEach((currentProduct) {
    //   InvoiceItem product = InvoiceItem.fromMap(currentProduct);

    //  products.add(product);
    // });
    return result;
  }

   getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableProduct'));
  }

  Future<InvoiceItem?> getProduct(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableProduct,
        columns: [columnId, columnUserId,columnInvoiceId, columnDescription, columnQuantity,columnVat,columnDiscount,columnUnitPrice],
        where: '$columnId = ?',
        whereArgs: [id]);

    // if (result.length > 0) {
    //   return new InvoiceItem.fromJson(result);
    // }

    return null;
  }

  Future<int> deleteInvoiceItem(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableProduct, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateInvoiceItem(InvoiceItem product) async {
    var dbClient = await db;
    return await dbClient.update(tableProduct, product.toMap(),
        where: "$columnId = ?", whereArgs: [product.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
