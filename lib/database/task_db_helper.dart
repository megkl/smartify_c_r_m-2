import 'package:sqflite/sqflite.dart';

import '../model/task_model.dart';

class TaskDatabaseHelper {
  static final _name = "tasks.db";
  static final _version = 1;

  Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();

    return _db!;
  }

  static final tableName = 'tasks';

  initDatabase() async {
    var db = await openDatabase(_name, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    userId TEXT,
                    taskName TEXT,
                    taskDescription TEXT,
                    status TEXT,
                    endTime TEXT,
                    startTime TEXT,
                    projectId TEXT,
                    color TEXT,
                    date TEXT
                    )''');
    });
    return db;
  }

  Future<int> insertTask(TaskModel task) async {
    var dbClient = await db;
    return await dbClient.insert(tableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateTask(TaskModel task) async {
    var dbClient = await db;
    return await dbClient.update(tableName, task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TaskModel>> getAllTask() async {
    var dbClient = await db;
    var res = await dbClient.query(tableName);
    List<TaskModel> list = res.map((c) => TaskModel.fromMap(c)).toList().reversed.toList();
    return list;
  }

  Future<Map<String, dynamic>> getTask(int id) async {
    var dbClient = await db;
    var result =
        await dbClient.query(tableName, where: 'id = ?', whereArgs: [id]);

    if (result.length > 0) {
      return result.first;
    }

    return {};
  }

   Future<List<TaskModel>> getTasksByDay(String day) async {
   var dbClient = await db;
    var res = await dbClient.query(tableName, where: 'date = ?', whereArgs: [day]);
    List<TaskModel> list = res.map((c) => TaskModel.fromMap(c)).toList().reversed.toList();
    return list;
    //"Mon, Feb 20, 23"

  }

  Future<int> deleteTask(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  closeDatabase() async {
    var dbClient = await db;
    await dbClient.close();
  }
}
