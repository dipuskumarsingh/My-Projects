


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
  static final String TABLE_NAME = 'user';
  static final String COLUMN_USER_ID = 'user_Id';
  static final String COLUMN_USER_NAME = 'user_name';
  static final String COLUMN_USER_EMAIL_ID = 'user_email';
  static final String COLUMN_USER_MOBILE_NUMBER = 'user_mobileNumber';
  static final String COLUMN_USER_PASSWORD = 'user_password';
  static final String COLUMN_USER_CREATED_DATE = 'user_created_date';

/// table no 2 for expanse data
  static final String TABLE_EXPANSE_NAME = 'ExpenseData';
  static final String COLUMN_EXPANSE_ID = 'ex_Id';
  static final String COLUMN_EXPANSE_USER_ID = 'user_Id';
  static final String COLUMN_EXPANSE_TITLE = 'ex_title';
  static final String COLUMN_EXPANSE_DESCRIPTION = 'ex_description';
  static final String COLUMN_EXPANSE_AMOUNT = 'ex_amount';
  static final String COLUMN_EXPANSE_BALANCE = 'ex_balance';
  static final String COLUMN_EXPANSE_TYPE = 'ex_type';
  static final String COLUMN_EXPANSE_CATEGORY_ID = 'ex_category_Id';
  static final String COLUMN_EXPANSE_TIME = 'Created_at';

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
      db.execute("create table $TABLE_NAME( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text not null, $COLUMN_USER_EMAIL_ID text not null, $COLUMN_USER_MOBILE_NUMBER text, $COLUMN_USER_PASSWORD text not null, $COLUMN_USER_CREATED_DATE text not null )");

      /// This table is used for the Expense data
      db.execute("create table $TABLE_EXPANSE_NAME( $COLUMN_EXPANSE_ID integer primary key autoincrement, $COLUMN_EXPANSE_USER_ID integer not null, $COLUMN_EXPANSE_TITLE text not null, $COLUMN_EXPANSE_DESCRIPTION text not null, $COLUMN_EXPANSE_AMOUNT real not null, $COLUMN_EXPANSE_BALANCE real not null, $COLUMN_EXPANSE_TYPE text not null, $COLUMN_EXPANSE_CATEGORY_ID integer not null, $COLUMN_EXPANSE_TIME text not null ) ");
      
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


/// to get data of expanse in the dashboard

 Future<List<expanseDataModel>>fecthExpanseData()async{
    var db = await getDb();
  List<Map<String, dynamic>> mData = await  db.query(TABLE_EXPANSE_NAME,orderBy: "$COLUMN_EXPANSE_TIME DESC"); /// (DESC) is used for add current date data in date base.
  List<expanseDataModel> mExpanse = [];
  for(Map<String, dynamic> eachExpanse in mData){
   mExpanse.add(expanseDataModel.fromMap(eachExpanse));
  }
  return mExpanse;
 }


}