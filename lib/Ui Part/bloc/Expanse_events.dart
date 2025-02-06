

import 'package:flutter/cupertino.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';

@immutable
sealed class ExpanseEventBloc{}

class addExpanseEventBloc extends ExpanseEventBloc{
  expanseDataModel newExpanseDataModel;
  addExpanseEventBloc({required this.newExpanseDataModel});
}
class fetchInitialExpanseBloc extends ExpanseEventBloc{}




class fetchFilteredExpanseBloc extends ExpanseEventBloc{
  int type;  /// it call a flag;
  fetchFilteredExpanseBloc({required this.type});   /// 0 for day , 1 for month, 2 for year, 3 for category.
}


class updateExpanseBloc extends ExpanseEventBloc{
  expanseDataModel updateExpanseDataModel;
  int id;
  updateExpanseBloc({required this.updateExpanseDataModel,required this.id});
}
class deleteExpanseBloc extends ExpanseEventBloc{
  int id;
  deleteExpanseBloc({required this.id});
}