


import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/userModels.dart';

class DbHelper{
  //global variable
  DbHelper._();
  static DbHelper getInstance()=>DbHelper._();
  /// global variable
  /// table no 1 for user
  static const TABLE_NAME = 'user';
  static const COLUMN_USER_ID = 'user_Id';
  static const COLUMN_USER_NAME = 'user_name';
  static const COLUMN_USER_EMAIL_ID = 'user_email';
  static const COLUMN_USER_MOBILE_NUMBER = 'user_mobileNumber';
  static const COLUMN_USER_PASSWORD = 'user_password';
  static const COLUMN_USER_CREATED_DATE = 'user_created_date';

/// table no 2 for expanse data
  static const TABLE_EXPANSE_NAME = 'ExpenseData';
  static const COLUMN_EXPANSE_ID = 'ex_Id';
  static const COLUMN_EXPANSE_USER_ID = 'user_Id';
  static const COLUMN_EXPANSE_TITLE = 'ex_title';
  static const COLUMN_EXPANSE_DESCRIPTION = 'ex_description';
  static const COLUMN_EXPANSE_AMOUNT = 'ex_amount';
  static const COLUMN_EXPANSE_BALANCE = 'ex_balance';
  static const COLUMN_EXPANSE_TYPE = 'ex_type';
  static const COLUMN_EXPANSE_CATEGORY_ID = 'ex_category_Id';
  static const COLUMN_EXPANSE_TIME = 'ex_date_time';

  /// table no 3 for CATEGORY data
  static const TABLE_CATEGORY_NAME = 'category';
  static const COLUMN_CATEGORY_ID = 'category_Id';
  static const COLUMN_CATEGORY_TITLE = 'title';
  static const COLUMN_CATEGORY_ICONS = 'icons';


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
      db.execute("create table $TABLE_NAME( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME String, $COLUMN_USER_EMAIL_ID String, $COLUMN_USER_MOBILE_NUMBER String, $COLUMN_USER_PASSWORD String, $COLUMN_USER_CREATED_DATE String )");

      /// This table is used for the Expense data
      db.execute("create table $TABLE_EXPANSE_NAME( $COLUMN_EXPANSE_ID integer primary key autoincrement, $COLUMN_EXPANSE_USER_ID integer, $COLUMN_EXPANSE_TITLE String, $COLUMN_EXPANSE_DESCRIPTION String, $COLUMN_EXPANSE_AMOUNT real, $COLUMN_EXPANSE_BALANCE real, $COLUMN_EXPANSE_TYPE integer, $COLUMN_EXPANSE_CATEGORY_ID integer, $COLUMN_EXPANSE_TIME String ) ");
      
      /// This table is used for the category data
      db.execute("create table $TABLE_CATEGORY_NAME( $COLUMN_CATEGORY_ID integer primary key autoincrement, $COLUMN_CATEGORY_TITLE String, $COLUMN_CATEGORY_ICONS String )");
    });
  }

  /// Queries
  ///
  /// this queries for register user
  Future<bool> registerUser({required userModels user})async{
    var db = await getDb();
    // if(! await isUserAlreadyRegister(email: user.userEmail)){
     int rowsEffected = await db.insert(TABLE_NAME, user.toMap());
      return rowsEffected > 0;
    // }else{
      return false;
    // }
  }

  /// this queries for register user check already register or not
  Future<bool> isUserAlreadyRegister({required String email})async{
    var db = await getDb();
    List<Map<String,dynamic>> mData = await db.query(TABLE_NAME,where: "$COLUMN_USER_EMAIL_ID = ? " ,whereArgs:[email] ); //// USER_MOBILE_NUMBER is used for check the what mobile number already register or not.
    return mData.isNotEmpty;
    // if(mData.isNotEmpty){
    //   return true;
    // }else{
    //   return false;
    // }
  }
  /// this for the check mobile number and email
// Future<bool> isUserAlreadyRegister({required String email, required String mobileNumber})async{
//     var db = await getDb();
//     List<Map<String,dynamic>> mData = await db.query(TABLE_NAME,where: "$COLUMN_USER_EMAIL_ID = ? OR $COLUMN_USER_MOBILE_NUMBER = ? ) ", whereArgs:[email,mobileNumber] ); //// USER_MOBILE_NUMBER is used for check the what mobile number already register or not.
//     return mData.isNotEmpty;
//     // if(mData.isNotEmpty){
//     //   return true;
//     // }else{
//     //   return false;
//     // }
// }

  /// this Queries is used for authenticate User  
 Future<bool> authenticateUser({required String emil, required String password})async{
    var db = await getDb();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NAME,where: "$COLUMN_USER_EMAIL_ID = ? AND $COLUMN_USER_PASSWORD = ?  ", whereArgs: [emil, password]);

    /// to manage session store UID in  shared_preferences
    if(mData.isNotEmpty){
      print("${mData[0][COLUMN_USER_ID]}");
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt("UID", mData[0][COLUMN_USER_ID]);
    }
      return mData.isNotEmpty;
 }

 /// to add expanse in the dashboard,

Future<bool> addExpanse({required expanseDataModel Ex})async{
    var db = await getDb();
  int  rowsEffected = await db.insert(TABLE_EXPANSE_NAME, Ex.toMap());
  return rowsEffected > 0;
}


}