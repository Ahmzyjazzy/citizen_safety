import 'package:sqflite/sqflite.dart';
import 'package:citizen_safety/models/user.dart';

class DbHelper {
  Database _db;
  final String tableName;

  DbHelper({this.tableName});

  Future open(String path, String tableString) async {
    _db = await openDatabase(path, version: 1,
        onCreate: (Database _db, int version) async {
      //TODO: Use string builder to create dynamic query
      await _db.execute(tableString);
    });
  }

  Future<User> insert(User user) async {
    await _db.insert(tableName, user.toJson());
    return user;
  }

  Future<User> getUser(int id, String columnName) async {
    List<Map> maps = await _db.query(tableName,
        columns: [], where: '$columnName = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromJson(maps.first);
    }
    return null;
  }

  Future<int> delete(int id, String columnName) async {
    return await _db
        .delete(tableName, where: '$columnName = ?', whereArgs: [id]);
  }

  Future<int> update(User user, String columnName) async {
    return await _db.update(tableName, user.toJson(),
        where: '$columnName = ?', whereArgs: [user.userId]);
  }

  Future close() async => _db.close();
}
