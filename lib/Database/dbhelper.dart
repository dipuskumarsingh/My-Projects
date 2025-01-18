

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  Database?  mDB;

  Future<Database>getDB()async{
    return mDB ??= await OpenDb();   // ?? --> show the null symbol
    // mDB = mDB ?? await OpenDb();
    // return mDB!;
  }

  //   if(mDB != null){
  //     return mDB!;
  //   }else{
  //     mDB =  await OpenDb();
  //     return mDB!;
  //   }
  // }

  Future<Database> OpenDb() async{

    var appDir  = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "MainDB.db");
    return openDatabase(dbPath, version: 1, onCreate: (db, version ){

      /// when db is created we need to create all the tables.

      db.execute("create table note ( note_id integer primary key autoincrement, note_title text , note_description text )");
    });
}
  /// Queries
 Future <bool> addNOte({required String title , required String description })async{
    var db = await getDB();
    int rowsEffected = await db.insert('note', {
      "note_title" : title,
      "note_description" : description,

    });
    return rowsEffected>0;
  }
  Future <List<Map<String,dynamic>>>FatchAllNotes()async{
     var db = await getDB();
     List<Map<String , dynamic>> mData = await db.query('note');
     return mData;
   }
}
