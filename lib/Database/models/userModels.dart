

import '../dbHelper/expanseDbHelper.dart';

/// this model for user data
class userModels{

  int? userId;
  String userName;
  String userEmail;
  String userMobileNumber;
  String userPassword;
  String userCreatedDate;

  userModels({this.userId, required this.userName, required this.userEmail, required this.userMobileNumber, required this.userPassword, required this.userCreatedDate});

  ///fromMap (form DB)
  factory userModels.fromMap(Map<String, dynamic> map) => userModels(
      userId: map[DbHelper.COLUMN_USER_ID],
      userName: map[DbHelper.COLUMN_USER_NAME],
      userEmail: map[DbHelper.COLUMN_USER_EMAIL_ID],
      userMobileNumber: map[DbHelper.COLUMN_USER_MOBILE_NUMBER],
      userPassword: map[DbHelper.COLUMN_USER_PASSWORD],
      userCreatedDate: map[DbHelper.COLUMN_USER_CREATED_DATE] );


  /// toMap (to DB)

  Map<String,dynamic> toMap() => {
    DbHelper.COLUMN_USER_NAME: userName,
    DbHelper.COLUMN_USER_EMAIL_ID: userEmail,
    DbHelper.COLUMN_USER_MOBILE_NUMBER: userMobileNumber,
    DbHelper.COLUMN_USER_PASSWORD: userPassword,
    DbHelper.COLUMN_USER_CREATED_DATE: userCreatedDate,
  };
}