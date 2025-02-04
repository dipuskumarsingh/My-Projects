

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
 import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:monety_ui/Ui%20Part/addExpansePage.dart';
import 'package:monety_ui/Ui%20Part/bloc/Expanse_state.dart';
import 'package:monety_ui/Ui%20Part/statistic.dart';
import 'bloc/Expanse_bloc.dart';
import 'bloc/Expanse_events.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateFormat Df = DateFormat.yMMMd();
  DbHelper dbHelper = DbHelper.getInstance();
  List<expanseDataModel> mExpanse = [];
  @override
 @override
  void initState() {
  
    super.initState();
    context.read<ExpanseBloc>().add(fetchInitialExpanseBloc());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExpansePage()));
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
                    child:
                    BlocBuilder<ExpanseBloc, ExpanseSateBloc>(builder: (_, state) {

                          if (state is loadingExpanseSate) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is errorExpanseSate) {
                            return Center(
                              child: Text(state.errorMassage),
                            );
                          }

                          if (state is loadedExpanseSate) {

                            return state.mExpanse.isNotEmpty ? ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.mExpanse.length,
                              itemBuilder: (context, index) {
                                final expanse = state.mExpanse[index];
                                return Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      border: Border.all(
                                          color:  Colors.grey.shade400,
                                          width: 1
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 6,
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("date",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold
                                                )),
                                            Spacer(),
                                            Text(
                                              "\$${expanse.expanseBalance}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: state.mExpanse[index].expanseBalance! < 0
                                                    ? Colors.red
                                                    : Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(),
                                        ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: state.mExpanse.length,
                                            itemBuilder: (_, childIndex){
                                              return ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                leading: Container(
                                                  padding: EdgeInsets.all(7),
                                                  width: 50,
                                                  height: 50,

                                                  // child: Image.asset(appConstant.mCategory.where((eachCat) {
                                                  //   return eachCat.categoryId==state.mExpanse[index].expanseId;
                                                  // }).toList()[0].categoryIcons),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(11),
                                                       // color: Colors.primaries[Random.nextInt(Colors.primaries.length-1)].shade100,
                                                    color:  Colors.lightBlue
                                                  ),

                                                ),
                                                title: Text(expanse.expanseTitle,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold)),
                                                subtitle: Text(expanse.expanseDescription,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey)),
                                                trailing: Text(
                                                  "\$${expanse.expanseAmount}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: expanse.expanseBalance! < 0
                                                        ? Colors.red
                                                        : Colors.green,
                                                  ),
                                                ),
                                              );
                                            })
                                      ],
                                    ),

                                );
                              },
                            )
                                : Center(
                              child: Text('No Expenses yet!!'),
                            );
                          }

                          return Container();
                        }),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
