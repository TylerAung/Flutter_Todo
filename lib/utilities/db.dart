import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import '../models/user.dart';

//CRUD with Flutter SQLITE Model
// https://docs.flutter.dev/cookbook/persistence/sqlite

// To Create SQLITE WITH CRUD
// https://blog.logrocket.com/flutter-sqlite-how-to-persist-data/ -2021
//https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b -2018


void main() async {
//Open Database
// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'users_database.db'),

    //Create Table in Db
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE USERS(userid TEXT PRIMARY KEY, name TEXT, password TEXT, email TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  //Insert User
  // Define a function that inserts dogs into the database
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the User into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'USERS',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //Retrieve list of users
  // A method that retrieves all the dogs from the dogs table.
  Future<List<User>> Users() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('USERS');

    // Convert the List<Map<String, dynamic> into a List<user>.
    return List.generate(maps.length, (i) {
      return User(
        userid: maps[i]['id'],
        name: maps[i]['name'],
        password: maps[i]['password'],
        email: maps[i]['email'],
      );
    });
  }


  //Update database
  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given user.
    await db.update(
      'USERS',
      user.toMap(),
      // Ensure that the User has a matching id.
      where: 'userid = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.userid],
    );
  }

  Future<void> deleteUser(String userid) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'USERS',
      // Use a `where` clause to delete a specific dog.
      where: 'userid = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [userid],
    );
  }

  //CREATE
  // Create a Dog and add it to the dogs table
  var fido = const User(
      userid: "X123",
      name: 'Tester Version 1',
      password: "TESTER1234",
      email: "test@test.com"
  );

  //RETRIEVE
  //Call method & add user
  await insertUser(fido);
  // Now, use the method above to retrieve all the dogs.
  print(await Users()); // Prints a list that include Fido.


  //UPDATE
  // Update Fido's age and save it to the database.
  var fidoV2 = const User(
      userid: "X123",
      name: 'Tester Version 1-V2',
      password: "TESTER1234-V2",
      email: "test@test.com-V2"
  );
  await updateUser(fidoV2);//update v1 to v2

// Print the updated results.
  print(await Users()); // Prints all Users


  //DELETE
  await deleteUser(fido.userid);
  // Print the list of dogs (empty).
  print(await Users());
}