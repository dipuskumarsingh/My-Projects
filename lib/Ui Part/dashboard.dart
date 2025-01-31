import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:monety_ui/Ui%20Part/addExpansePage.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_events.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_state.dart';
import 'package:monety_ui/Ui%20Part/statistic.dart';

import 'bloc/Expanse_bloc.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<expanseDataModel> mExpanse = [];
  @override
 @override
  void initState() {
  
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> ExpenseData = [
    //   {'icons':Icons.shopping_cart_outlined, 'color':Colors.deepPurple[100], 'work':'Shop','workDetails':'Buy new clothes', 'price': '-\$90'},
    //   {'icons':Icons.phone_android_outlined,'color':Colors.yellow[100], 'work':'Electronic','workDetails':'Buy new Iphone', 'price': '-\$129'},
    //   {'icons':Icons.car_rental_outlined, 'color':Colors.green[100],'work':'Electronic','workDetails':'Buy new car', 'price': '-\$13980'},
    // ];
    // List<Map<String, dynamic>> Monday =[
    //    {'icons':Icons.book_outlined, 'color':Colors.orange[100], 'work':'Books','workDetails':'Buy new books', 'price': '-\$60'},
    // ];


    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddeExpansePage()));
      }, child:Icon(Icons.add) ,),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: Row(
            /// this for logo and search icons
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/icons/logo.png',width: 50, height: 50,),
                    Text('Monety', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Icon(Icons.search_rounded, size: 40, color: Colors.black87,),
            ],
          ),
        ),
      ),
      body: Container(
        // margin: EdgeInsets.only(top:30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Row(
                    /// this for second sub heading including the profile images and text and dropdown manu
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            // border: Border.all(width:0.5),
                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage('Assets/icons/iconsDpimages.jpg'))),
                      ),
                      SizedBox(width: 1,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Morning', style: TextStyle(fontSize: 24,fontFamily: 'H1fonts', color: Colors.grey),),
                          Text('Blaszcxywofc', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('This month', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,fontFamily: 'H1fonts'),),
                            InkWell(
                              onTap: (){
                                print('this clickable');
                              },
                                child: Icon(Icons.arrow_drop_down)),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Statistic()));
                      print("this is clickeable");
                    },
                    child: Stack(
                      children: [
                        Container(   /// here we design container box and texts inside the box.
                        width: 360,
                        height: 175,
                        decoration: BoxDecoration(
                          color: Color(0xff6572d0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5),
                              Text('Expense total', style: TextStyle(fontSize: 25, color: Colors.white),),
                              Text('\$3,734', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: Text(
                                      '+\$240',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(width: 4,),
                                  Text('than last month', style: TextStyle(fontSize: 20, color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                               Align(
                              alignment: Alignment(1.35,0),
                              child: Image.asset('Assets/icons/pieChart.png',width: 180,height: 180,))
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Expense List', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,fontFamily:'H1fonts'),),
                  SizedBox(height: 10,),
                  Expanded(
                    child: BlocBuilder<ExpanseBloc,ExpanseSateBloc>(builder: (_,state){
                      if(state is loadingExpanseSate){
                        return Center(child: CircularProgressIndicator());
                      }
                      if(state is errorExpanseSate){
                        return Center(child: Text(state.errorMassage));
                      }
                      if(state is loadedExpanseSate){
                        return state.mExpanse.isNotEmpty ? ListView.builder(
                            itemCount: state.mExpanse.length,
                            itemBuilder: (_,index){
                              // final mExpanses = mExpanse[index];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(state.mExpanse[index].expanseTime),
                                      Text(state.mExpanse[index].expanseAmount.toString()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(state.mExpanse[index].expanseTitle),
                                      Text(state.mExpanse[index].expanseDescription),
                                    ],
                                  ),
                                  Text('descripation')
                                ],);

                            }
                        ): Container(child: Text('No Expanse found Yet!!'),);
                      }
                      return SizedBox();
                    }),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
