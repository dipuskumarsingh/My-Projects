import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'introScreen.dart';
import 'loginPage.dart';

void main() {
  runApp(BlocProvider(create: (context)=>ExpanseBloc(dbHelp: DbHelper.getInstance()),child: MyApp(),)) ;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'splashScreen',
      home: SplaceScreen(),
    );
  }
}

class SplaceScreen extends StatefulWidget{
  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}
class _SplaceScreenState extends State<SplaceScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),()async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>introScreen()));
      var prefs = await SharedPreferences.getInstance();    /// here we maintain the session [if] user log in the app dricatily got to the Dashboard screen [else] he go to the login screen
     int uid = prefs.getInt("UID") ?? 0;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>introScreen()));
     Widget navigateTo = loginpage();
     if(uid > 0){
       navigateTo = Dashboard();
     }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>navigateTo,));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 330,),
            Image.asset('Assets/icons/logo.png',width: 120,),
            Text('Monety',style: TextStyle(fontSize: 32,fontFamily: 'subfonts',letterSpacing: 3,fontWeight: FontWeight.w800,color: Colors.white),),
            SizedBox(height: 350,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wellcome',style: TextStyle(fontSize: 18,fontFamily: 'H1fonts',color: Colors.white,letterSpacing: 2),),
                SizedBox(width: 05,),
                Icon(Icons.arrow_forward,size: 18,color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );

  }
}
