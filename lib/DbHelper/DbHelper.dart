import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:noteappprovider/Models/NoteModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  DbHelper._();
  static final DbHelper instence = DbHelper._();
  Database? _database;
  static const String notetable="notetable";
  static const String column_id="columnid";
  static const String column_title="columntitle";
  static const String column_desc="columndesc";

  Future<Database>getDb()async{
    if(_database!=null){
      return _database!;
    }
    else{
      return await initDb();
    }
  }
  Future<Database>initDb()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath= join(directory.path+"notesdb.db");
    return await openDatabase(dbpath,version: 1,onCreate: (db,version){
      return db.execute("create table $notetable($column_id integer primary key autoincrement $column_title text , $column_desc text)");
    });
  }
  insertnote(NoteModel noteModel)async{
    var db = await getDb();
    await db.insert(notetable,noteModel.toMap());
  }
  Future<List<NoteModel>>getData()async{
    var db = await getDb();
    List<NoteModel>noteslist=[];
    var data = await db.query(notetable);
    for(Map<String,dynamic>eachData in data){
      NoteModel noteModel = NoteModel.fromMap(eachData);
      noteslist.add(noteModel);
    }
    return noteslist;
  }
  Future<void>updatenote(NoteModel notes)async{
    var db= await getDb();
    await db.update(notetable, notes.toMap(),where:"$column_id=${notes.id}");
  }
  Future<void>deletenote(int column_id)async{
    var db = await getDb();
    await db.delete(notetable,where: "$column_id=?",whereArgs: []);
  }
}