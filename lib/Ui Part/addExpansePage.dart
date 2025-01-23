

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monety_ui/Domain/appConstant.dart';
import 'package:path/path.dart';

import '../Domain/uiHelper.dart';

class AddeExpansePage extends StatelessWidget{
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _addAmount = TextEditingController();
  List<String> mType = ['Debit','Credit','Loan','Borrow','Lend',];
  String selectedType = 'Debit';   /// its is used for the select data form the drop down menu.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Add Expanse",style: TextStyle(fontSize: 25,fontFamily: 'subfonts'),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20,right: 20),
        child:Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              decoration: BoxDecoration(
              color: Color(0xffefefef),
                border: Border.all(color: Colors.grey, width: 2,),
                borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: _title,style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 18,color: Colors.grey,letterSpacing: 2),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
                ),
                ),
                ),
            mSpacer(mHeight: 20),
            Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              decoration: BoxDecoration(
                  color: Color(0xffefefef),
                  border: Border.all(color: Colors.grey, width: 2,),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: _description,style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(fontSize: 18,color: Colors.grey,letterSpacing: 2),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
            mSpacer(mHeight: 20),
            Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              decoration: BoxDecoration(
                  color: Color(0xffefefef),
                  border: Border.all(color: Colors.grey, width: 2,),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: TextField(
                controller: _addAmount,style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Amount',
                    hintStyle: TextStyle(fontSize: 18,color: Colors.grey,letterSpacing: 2),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
            mSpacer(mHeight: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu(   /// this used for make a drop down menu.
                  width: 150,
                  label: Text('Expanse type',style: TextStyle(fontSize: 22),),
                  inputDecorationTheme: InputDecorationTheme(
                    fillColor: Color(0xffefefef),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.2,color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(5),
                      borderSide: BorderSide(width: 2.2,color: Colors.grey)
                    ),
                  ),
                  
                  initialSelection: selectedType,
                    onSelected: (value){
                    selectedType = value!;  /// value! --> show it can be null
                    },
                    dropdownMenuEntries: mType.map((value){
                  return DropdownMenuEntry(
                      value: value, label: value,);
                }).toList(),),
                InkWell(
                  onTap: (){
                    showModalBottomSheet(
                      context: context, builder: (context)=>Container(
                      child: GridView.builder(
                        itemCount: appConstant.mCategory.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,childAspectRatio: 3/4 ), itemBuilder: (_,index){
                        return Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(onTap:(){
                                Navigator.pop(context);
                              },
                                  child: Image.asset(appConstant.mCategory[index].categoryIcons.toString(),width: 50,height: 50,color: Colors.blue,)),
                              mSpacer(mHeight: 10),
                              Text(appConstant.mCategory[index].categoryTitle.toString(),style: TextStyle(fontSize: 18,fontFamily: 'subfonts'),),

                            ],
                          ),
                        );
                      }),
                    ),);
                  },
                  child: Container(
                    width: 150,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2.2,color: Colors.grey),
                      color: Color(0xffefefef)
                    ),
                    child: Center(child: Text('Category',style: TextStyle(fontSize: 18),)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}