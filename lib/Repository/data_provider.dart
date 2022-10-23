import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app/Blocs/events_repository.dart';



class DataProvider  {

  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }


  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'lista.db'),
      version: 1,
      onCreate:(db, version) {
    // Run the CREATE TABLE statement on the database.

    return db.execute(
      'CREATE TABLE lista(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
    );
    
  }
    );
  }

  save(texto) async {
//notifyListeners();
    final db = await database;
    await db.insert(
      'lista',
      {"name":texto},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );

  }

  delete(id) async {
    final db = await database;

    await db.delete(
      'lista',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  getData() async { 

    final db = await database; 
   dynamic lista = await db.query('lista');
    return lista;
  }
}

var db = DataProvider();
