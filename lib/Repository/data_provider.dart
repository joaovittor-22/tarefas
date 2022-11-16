import 'dart:html';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app/Blocs/events_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DataProvider  {
final storage = FirebaseStorage.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
// Create a storage reference from our app
final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"




  //Instancia do SQLite
/*  static Database? _database;

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
  }*/


  addImage(Uint8List file, String name )async{

final mountainsRef = storageRef.child("${name}");
try {
  var stored =  await mountainsRef.putData(file);
  firestore.collection('images').add({"link": await stored.ref.getDownloadURL()});
} on FirebaseException  catch (e) {
print(e);
}
  }

  getImages()async {
    var list = [];
await  firestore.collection('images').get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          dynamic data = doc.data();
 list.add(data["link"]);
        });
    } );
return list;
  }

}

var db = DataProvider();
