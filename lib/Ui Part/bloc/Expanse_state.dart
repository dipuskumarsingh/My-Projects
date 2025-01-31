

import 'package:flutter/cupertino.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';

@immutable
sealed class ExpanseSateBloc {}
class initialExpanseSate extends ExpanseSateBloc{}
class loadingExpanseSate extends ExpanseSateBloc{}

class loadedExpanseSate extends ExpanseSateBloc{
  List<expanseDataModel> mExpanse;
  loadedExpanseSate({required this.mExpanse});
}

class errorExpanseSate extends ExpanseSateBloc{
  String errorMassage;
  errorExpanseSate({required this.errorMassage});
}