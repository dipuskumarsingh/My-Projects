

import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';

///here creating EXPANSE MODELS each tables which are created in the EXPANSE DB HELPER.


/// this model for expanse data

class expanseDataModel{

  int? expanseId;
  int? expanseUserId;
  String expanseTitle;
  String expanseDescription;
  double? expanseAmount;
  double? expanseBalance;
  String expanseType;
  int expanseCategoryId;
  String? created_at;

  expanseDataModel({
    this.expanseId,
    required this.expanseUserId,
    required this.expanseTitle,
    required this.expanseDescription,
    required this.expanseAmount,
    required this.expanseBalance,
    required this.expanseType,
    required this.expanseCategoryId,
    required this.created_at});

  /// from Map (from DB)

  factory expanseDataModel.fromMap(Map<String, dynamic>map) => expanseDataModel(
    expanseId: map[DbHelper.COLUMN_EXPANSE_ID],
    expanseUserId: map[DbHelper.COLUMN_EXPANSE_USER_ID],
    expanseTitle: map[DbHelper.COLUMN_EXPANSE_TITLE],
    expanseDescription: map[DbHelper.COLUMN_EXPANSE_DESCRIPTION],
    expanseAmount: map[DbHelper.COLUMN_EXPANSE_AMOUNT],
    expanseBalance: map[DbHelper.COLUMN_EXPANSE_BALANCE],
    expanseType: map[DbHelper.COLUMN_EXPANSE_TYPE],
    expanseCategoryId: map[DbHelper.COLUMN_EXPANSE_CATEGORY_ID],
    created_at: map[DbHelper.COLUMN_EXPANSE_TIME],
  );

  /// to map  (to DB)

  Map<String, dynamic> toMap() =>{
    DbHelper.COLUMN_EXPANSE_USER_ID : expanseUserId,
    DbHelper.COLUMN_EXPANSE_TITLE : expanseTitle,
    DbHelper.COLUMN_EXPANSE_DESCRIPTION : expanseDescription,
    DbHelper.COLUMN_EXPANSE_AMOUNT : expanseAmount,
    DbHelper.COLUMN_EXPANSE_BALANCE : expanseBalance,
    DbHelper.COLUMN_EXPANSE_TYPE : expanseType,
    DbHelper.COLUMN_EXPANSE_CATEGORY_ID : expanseCategoryId,
    DbHelper.COLUMN_EXPANSE_TIME : created_at,
  };
}

