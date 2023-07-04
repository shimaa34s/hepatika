import 'package:sqflite/sqflite.dart';

import 'constants2.dart';
import 'helper.dart';
import 'note.dart';

class CURD{
  CURD.instance();
  static final CURD curd=CURD.instance();
  Database? db;
  init()async{
    db=await Helper.helper.createNoteDb();
    if(db!=null){
      print('database is initialized');
    }
  }
  Future<int> saveNote(Note note)async {
   return await db!.insert(TABLE_NAME, note.toMap());
  }

  Future<List<Note>> viewNotes()async {
    if(db==null){
      db=await Helper.helper.createNoteDb();

    }
    List<Map<String,dynamic>> resulte = await db!.query(TABLE_NAME,orderBy: '$COL_DATE desc');
   return resulte.map((e) => Note.fromMap(e)).toList();
  }

  Future<int> deleteNote(int? id) async{
   return await db!.delete(TABLE_NAME,where: '$COL_ID=?',whereArgs: [id]);
  }

  Future<int> updateNote(Note note) {
    return   db!.update(TABLE_NAME, note.toMap(),where: '$COL_ID=?',whereArgs: [note.id]);
  }
}