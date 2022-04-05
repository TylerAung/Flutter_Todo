import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';

//https://github.com/codingpizza/todoapp

class DatabaseHelper {
  //Create a private constructor
  DatabaseHelper._();

  static const databaseName = 'todos_database.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static late Database _database;

  Future<Database> get database async {
    log('Uds Database: $_database');
    debugPrint('Uds Database: $_database');

    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE ACCOUNTS(userid TEXT PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, password TEXT, email TEXT)");
        });
  }

  insertUser(User user) async {
    final db = await database;
    var res = await db.insert(User.TABLENAME, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<User>> retrieveUsers() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(User.TABLENAME);

    return List.generate(maps.length, (i) {
      return User(
        userid: maps[i]['userid'],
        name: maps[i]['name'],
        password: maps[i]['password'],
        email: maps[i]['email'],
      );
    });
  }

  updateUser(User todo) async {
    final db = await database;

    await db.update(User.TABLENAME, todo.toMap(),
        where: 'userid = ?',
        whereArgs: [todo.userid],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteUser(String userid) async {
    var db = await database;
    db.delete(User.TABLENAME, where: 'userid = ?', whereArgs: [userid]);
  }
}