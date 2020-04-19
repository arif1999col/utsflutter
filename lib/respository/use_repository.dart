import 'package:uts/database/database.dart';
import 'package:uts/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {

  static final dbProvider  = DatabaseProvider.dbProvider;

  Future<List> getAllUser() async {
    final db = await dbProvider.database;

    var result  = await db.query('user');

    return result.toList();
  }

  Future<List<UserModel>> getUser(id) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'id = ?', whereArgs: [id]);
    List<UserModel> _user = result.isNotEmpty
        ? result.map((item) => UserModel.fromDatabaseJson(item)).toList()
        : [];

    return _user;
  }

  Future login(username, password) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'username = ?', whereArgs: [username]);
    if (result.isNotEmpty) {
      var data  = result.first;
      if (data['password'] == password) {
        return data;
      }
    }
  }

  Future storeUser(UserModel user) async {
    final db = await dbProvider.database;

    var result = await db.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future updateUser(UserModel user) async {
    final db = await dbProvider.database;

    var result = await db.update('user', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future deleteUser(id) async {
    final db = await dbProvider.database;

    var result = await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}