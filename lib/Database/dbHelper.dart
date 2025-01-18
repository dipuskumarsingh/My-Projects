


import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  Database? mDB;
  Future<Database>getDb()async{
    mDB = mDB ?? await openDb();
    return mDB!;
  }



  Future<Database>openDb() async{
    var appData = await getApplicationDocumentsDirectory();
    String DbPath = join(appData.path, 'mainDb.db');
    return openDatabase(DbPath, version: 1, onCreate: (db, version){

      /// now creating table
      /// this table is created for the users
      db.execute("create table user( user_Id integer primary key autoincrement, user_name String, user_email String, user_mobileNumber String, user_password String, user_created_date String )");

      /// This table is used for the Expense data
      db.execute("create table ExpenseData( ex_Id integer primary key autoincrement, user_Id integer, ex_title String, ex_description String, ex_amount real, ex_balance real, ex_type integer, ex_category_Id integer, ex_date_time String ) ");
      
      /// This table is used for the category data
      db.execute("create table category( category_Id integer primary key autoincrement, title String, icons String )");
    });
  }

  /// Queries


}