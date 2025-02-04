

import 'package:flutter/cupertino.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';

@immutable
sealed class ExpanseEventBloc{}

class addExpanseEventBloc extends ExpanseEventBloc{
  expanseDataModel newExpanseDataModel;
  addExpanseEventBloc({required this.newExpanseDataModel});
}
class fetchInitialExpanseBloc extends ExpanseEventBloc{}


class updateExpanseBloc extends ExpanseEventBloc{
  expanseDataModel updateExpanseDataModel;
  int id;
  updateExpanseBloc({required this.updateExpanseDataModel,required this.id});
}
class deleteExpanseBloc extends ExpanseEventBloc{
  int id;
  deleteExpanseBloc({required this.id});
}