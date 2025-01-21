import 'dart:async';

import 'package:flutter/material.dart';

import 'introScreen.dart';

void main() {
  runApp(MyApp());
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
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>introScreen()));
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
