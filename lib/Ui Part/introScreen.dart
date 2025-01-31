


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'loginPage.dart';
class introScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Row(        /// logo and text design
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/icons/logo.png',width: 50,height: 50,),
              Text('Monety',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150,left: 17),
                width:380,
                height: 520,
                decoration: BoxDecoration(
                  color: Color(0xffcac9c9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      Text('Easy way to monitor your expense',textAlign: TextAlign.center, style: TextStyle(fontSize:35,fontWeight: FontWeight.bold,),),
                      SizedBox(height: 30,),
                      Text('Safe your future by managing your expense right now',textAlign: TextAlign.center, style: TextStyle(fontSize:22,color: Colors.grey[200]),),
                      SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.circle,size: 15,color:Colors.grey[400],),
                            Icon(Icons.circle,size: 15,color:Colors.grey[400],),
                            Icon(Icons.circle,size: 15,color:Colors.orange[400],),
                            SizedBox(width: 245,),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 7),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Icon(Icons.arrow_forward,size: 40,color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.1, -1.5),
                child: Container(
                  width: 450,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Color(0xffffff),
                      image: DecorationImage(fit:BoxFit.cover,image: AssetImage('Assets/images/mainImages.png'))
                  ),

                ),
              ),

            ],
          ),
      ),
      );
    
  }
}