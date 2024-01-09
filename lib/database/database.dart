// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:phonebook/model/model.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  Future<Database> initDB() async {
    // create database
    String path = await getDatabasesPath();

    return openDatabase(
      join(
        //set database path
        path,
        //set database Name
        "phone.db",
      ),
      onCreate: (database, version) async {
        //create database table and variable
        await database.execute("""
    CREATE TABLE MYTable(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      surname TEXT NOT NULL,
      number TEXT NOT NULL,
      email TEXT NOT NULL
    )
  """);
      },

      //version name
      version: 3,
    );
  }

  //Inserting the data into the data table
  Future<bool> insertDB(DataModel dataModel) async {
    try {
      //Initialize database in sqflite and set instance name in db
      final Database db = await initDB();
      //Insert the data into MYTable database table
      await db.insert("MYTable", dataModel.toMap());
      return true;
    } catch (e) {
      print('Error inserting data: $e');
      return false;
    }
  }

  Future<List<DataModel>> getData() async {
    try {
      final Database db = await initDB();
      //get the data from database using query object
      final List<Map<String, Object?>> datas = await db.query("MYTable");
      return datas.map((e) => DataModel.fromMap(e)).toList();
    } catch (e) {
      print('Error getting data: $e');
      return [];
    }
  }

  Future<void> updateData(DataModel dataModel, int id) async {
    try {
      print(id);
      final Database db = await initDB();
      // update the data into database using id locations
      await db.update("MYTable", dataModel.toMap(), where: "id=?", whereArgs: [10]).then((value) => print("success"));
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  Future<void> deleteData(int id) async {
    try {
      final Database db = await initDB();
      //delete the data using id
      await db.delete("MYTable", where: "id=?", whereArgs: [id]);
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}
