


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_events.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_state.dart';

import '../../Database/models/filteringModel.dart';

class ExpanseBloc extends Bloc<ExpanseEventBloc,ExpanseSateBloc>{
  DbHelper dbHelp;
  DateFormat df = DateFormat.yMMMd();
  ExpanseBloc({required this.dbHelp}) : super(initialExpanseSate()){
    on<addExpanseEventBloc>((event , emit)async{
     bool check =  await dbHelp.addExpanse(Ex: event.newExpanseDataModel);
     emit(loadingExpanseSate());
     if(check){
       List<expanseDataModel> allExpanses  = await dbHelp.fecthExpanseData();
       emit(loadedExpanseSate(mExpanse: allExpanses));
     }else{
       emit(errorExpanseSate(errorMassage: "Expanse not found"));
     }
    });
    on<fetchInitialExpanseBloc>((event, emit)async{
      emit(loadingExpanseSate());
     List<expanseDataModel> allExpanses =  await dbHelp.fecthExpanseData();
     emit(loadedExpanseSate(mExpanse: allExpanses));
    });
    on<fetchFilteredExpanseBloc>((event, emit)async{
      emit(loadingExpanseSate());
      List<expanseDataModel> allExpanses = await dbHelp.fecthExpanseData();
      if(event.type == 0){
        df = DateFormat.yMMMd();
      }else if(event.type == 1){
        df = DateFormat.yMMM();
      }else{
        df = DateFormat.y();
      }
      emit(filterLoadedExpanseSate(mFilterExpanse: filterExp(allExpanses)));
    });

  }

  List<filteringModelExpanse> filterExp(List<expanseDataModel> allExpenses){
    ///filtering data
    List<filteringModelExpanse> filteredExpenses = [];

    List<String> uniqueDates = [];

    for(expanseDataModel eachExp in allExpenses){

      String eachDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at!)));

      if(!uniqueDates.contains(eachDate)){
        uniqueDates.add(eachDate);
      }

    }

    print(uniqueDates);   /// this code is used know the unique dates

    for(String eachDate in uniqueDates){
      num eachMillis = 0;
      num balance = 0.0;
      List<expanseDataModel> eachDateExp = [];


      for(expanseDataModel eachExp in allExpenses){
        eachMillis = int.parse(eachExp.created_at!);
        String eachExpDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.created_at!)));

        if(eachExpDate==eachDate){
          eachDateExp.add(eachExp);

          if(eachExp.expanseType=="Debit"){
            balance -= eachExp.expanseAmount!;
          } else {
            balance += eachExp.expanseAmount!;
          }

        }

      }

      /// this code write for know the out what out is come in ui.
      print("eachDate: $eachDate");
      print("bal: $balance");
      print("items: ${eachDateExp.length}");

      // filteredExpenses.add(filteringModelExpanse(millis: eachMillis, type: eachDate, balance: balance, allExpenses: eachDateExp));
      filteredExpenses.add(filteringModelExpanse(millis:eachMillis ,type: eachDate, Balance: balance, allExpanses: eachDateExp));

    }

    return filteredExpenses;
  }
}