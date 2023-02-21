import 'package:sqflite/sqflite.dart';

import '../model/project_model.dart';

class ProjectDatabaseHelper {
    static final _name = "projects.db";
    static final _version = 1;

    Database? _db;
    Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();

    return _db!;
  }
    static final tableName = 'projects';

    initDatabase() async {
        var db = await openDatabase(
            _name,
            version: _version,
            onCreate: (Database db, int version) async {
                await db.execute(
                    '''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    userId TEXT,
                    projectName TEXT,
                    projectDescription TEXT,
                    status TEXT
                    )'''
                );
            }
        );
        return db;
    }

    Future<int> insertProject(ProjectModel project) async {
      var dbClient = await db;
        return await dbClient.insert(tableName, 
            project.toMap(), 
            conflictAlgorithm: ConflictAlgorithm.replace
        );
    }

    Future<int> updateProject(ProjectModel project) async {
      var dbClient = await db;
        return  await dbClient.update(tableName, project.toMap(),
            where: 'id = ?', 
            whereArgs: [project.id],
            conflictAlgorithm: ConflictAlgorithm.replace
        );
    }

    Future<List<ProjectModel>> getAllProject() async {
      var dbClient = await db;
        var res =  await dbClient.query(tableName);
    List<ProjectModel> result = res.map((c) => ProjectModel.fromMap(c)).toList().reversed.toList();
      return result;
    }

    Future<Map<String, dynamic>> getProject(int id) async {
      var dbClient = await db;
        var result = await dbClient.query(tableName,
            where: 'id = ?',
            whereArgs: [id]
        );

        if (result.length > 0) {
            return result.first;
        }

        return {};
    }

    Future<int> deleteProject(int id) async {
      var dbClient = await db;
        return await dbClient.delete(tableName,
            where: 'id = ?',
            whereArgs: [id]
        );
    }

    closeDatabase() async {
      var dbClient = await db;
        await dbClient.close();
    }
}