


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_events.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_state.dart';

class ExpanseBloc extends Bloc<ExpanseEventBloc,ExpanseSateBloc>{
  DbHelper dbHelp;
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
  }
}