import 'package:smartify_c_r_m/model/invoice_model.dart';
import 'package:sqflite/sqflite.dart';


class InvoiceDatabaseHelper {
  static final _name = "invoices.db";
  static final _version = 1;

  Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();

    return _db!;
  }

  static final tableName = 'invoices';

  initDatabase() async {
    var db = await openDatabase(_name, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    userId TEXT,
                    name TEXT,
                    customerId INTEGER,
                    termId INTEGER,
                    description TEXT,
                    number TEXT,
                    status TEXT,
                    dueDate TEXT,
                    date TEXT
                    )''');
                    
    });
    return db;
  }

  Future<int> insertInvoice(Invoice invoice) async {
    var dbClient = await db;
    return await dbClient.insert(tableName, invoice.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateInvoice(Invoice invoice) async {
    var dbClient = await db;
    return await dbClient.update(tableName, invoice.toMap(),
        where: 'id = ?',
        whereArgs: [invoice.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Invoice>> getAllInvoice() async {
    var dbClient = await db;
    var res = await dbClient.query(tableName);
    List<Invoice> list = res.map((c) => Invoice.fromMap(c)).toList().reversed.toList();
    return list;
  }

  Future<Map<String, dynamic>> getInvoice(int id) async {
    var dbClient = await db;
    var result =
        await dbClient.query(tableName, where: 'id = ?', whereArgs: [id]);

    if (result.length > 0) {
      return result.first;
    }

    return {};
  }

  Future<int> deleteInvoice(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  closeDatabase() async {
    var dbClient = await db;
    await dbClient.close();
  }
}
