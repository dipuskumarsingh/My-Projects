

import 'package:flutter/cupertino.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';

import '../../Database/models/filteringModel.dart';

@immutable
sealed class ExpanseSateBloc {}
class initialExpanseSate extends ExpanseSateBloc{}
class loadingExpanseSate extends ExpanseSateBloc{}

class loadedExpanseSate extends ExpanseSateBloc{
  List<expanseDataModel> mExpanse;
  loadedExpanseSate({required this.mExpanse});
}

class filterLoadedExpanseSate extends ExpanseSateBloc{
  List<filteringModelExpanse> mFilterExpanse;
  filterLoadedExpanseSate({required this.mFilterExpanse});
}


class errorExpanseSate extends ExpanseSateBloc{
  String errorMassage;
  errorExpanseSate({required this.errorMassage});
}