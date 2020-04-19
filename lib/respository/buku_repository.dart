import 'package:uts/database/database.dart';
import 'package:uts/models/buku_model.dart';
import 'package:sqflite/sqflite.dart';

class BukuRepository {

  static final dbProvider  = DatabaseProvider.dbProvider;

  Future<List> getAllBuku() async {
    final db = await dbProvider.database;
   var result  = await db.query('buku');
    return result.toList();
  }

   Future<List> countBuku() async {
    final db = await dbProvider.database;
   var result  = await db.query("SELECT COUNT(buku)");
    return countBuku();
  }

  Future<List<BukuModel>> getBuku(id) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result;
    result  = await db.query('user', where: 'id = ?', whereArgs: [id]);
    List<BukuModel> _user = result.isNotEmpty
        ? result.map((item) => BukuModel.fromMap(item)).toList()
        : [];

    return _user;
  }

  Future storeBuku(BukuModel buku) async {
    final db = await dbProvider.database;

    var result = await db.insert('buku', buku.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future updateBuku(BukuModel buku) async {
    final db = await dbProvider.database;

    var result = await db.update('buku', buku.toMap(), where: 'id = ?', whereArgs: [buku.id]);
  }

  Future deleteBuku(id) async {
    final db = await dbProvider.database;

    var result = await db.delete('buku', where: 'id = ?', whereArgs: [id]);
  }
  
}