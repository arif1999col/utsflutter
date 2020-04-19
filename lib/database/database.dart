import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uts/models/user_model.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    await insertAdmin();
    return _database;
  }

  createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path         = join(directory.path, 'kasirin.db');
    var database = await openDatabase(path,
        version: 2, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      initDB(database, newVersion);
    }
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE IF NOT EXISTS user ("
        "id INTEGER PRIMARY KEY,"
        "username varchar(50),"
        "name varchar(50),"
        "password varchar(50),"
        "role varchar(50)"
        ")");

    
    await database.execute("CREATE TABLE IF NOT EXISTS buku ("
        "id INTEGER PRIMARY KEY,"
        "name varchar(50),"
        "tipe varchar(50),"
        "stock varchar(50)"
        ")");

    
    print('Database created');
  }

  Future<int> insertAdmin() async {
    final db = _database;
    var user  = new UserModel(id: 1, name: 'Admin', username: 'admin', password: 'admin', role: 'Admin');
    final List<Map<String, dynamic>> response = await db.query('user',  where: 'id = ?', whereArgs: [1]);
    if (response.length == 0) {
      var response  = await db.insert('user', user.toMap());
      return response;
    }
  }
}