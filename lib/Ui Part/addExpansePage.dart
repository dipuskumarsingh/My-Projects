

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'package:monety_ui/Database/models/expanseModels.dart';
import 'package:monety_ui/Domain/appConstant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Domain/uiHelper.dart';

class AddeExpansePage extends StatefulWidget{
  @override
  State<AddeExpansePage> createState() => _AddeExpansePageState();
}

class _AddeExpansePageState extends State<AddeExpansePage> {
  TextEditingController _title = TextEditingController();

  TextEditingController _description = TextEditingController();

  TextEditingController _addAmount = TextEditingController();

  DbHelper Db = DbHelper.getInstance();
  List<String> mType = ['Debit','Credit','Loan','Borrow','Lend',];

  String selectedType = 'Debit';  /// its is used for the select data form the drop down menu.
  int selectedIndex = -1;  /// its make global variable for category items to selected the icons.
  DateTime? selectedDateTime;
  DateFormat Df = DateFormat.MMMEd();   ///yMMMEd();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 28),
          child: Text("Add Expanse",style: TextStyle(fontSize: 25,fontFamily: 'subfonts'),),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20,right: 20),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.clear,color: Colors.red,size: 40,)),
                InkWell(
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();    /// here we maintain the session [if] user log in the app dricatily got to the Dashboard screen [else] he go to the login screen
                    int uid = prefs.getInt("UID") ?? 0;
                    Db.addExpanse(Ex: expanseDataModel(   /// here adding the value in expanse area
                      /// this work implement same with the BLOCK Sate.
                        expanseUserId: uid,
                        expanseTitle: _title.text,
                        expanseDescription: _description.text,
                        expanseAmount: double.parse(_addAmount.text),
                        expanseBalance:0,
                        expanseType: selectedType,
                        expanseCategoryId: appConstant.mCategory[selectedIndex].categoryId.toString(),  /// here some doute.
                        expanseTime: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch.toString(),
                    ));
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.check_sharp,color: Colors.green,size: 40,)),
              ],
            ),
            mSpacer(mHeight: 10),
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
                  textStyle: TextStyle(fontSize: 16),
                  width: 150,
                  label: Text('Expanse type',style: TextStyle(fontSize: 18),),
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
                    style: ButtonStyle(
                      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 25)),
                    ),
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
                          child: InkWell(
                            onTap: (){
                              selectedIndex = index; /// it select all index
                              Navigator.pop(context);
                              setState(() {

                              });

                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(appConstant.mCategory[index].categoryIcons.toString(),width: 50,height: 50,color: Colors.blue,),
                                mSpacer(mHeight: 10),
                                Text(appConstant.mCategory[index].categoryTitle.toString(),style: TextStyle(fontSize: 18,fontFamily: 'subfonts'),),

                              ],
                            ),
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
                    child: selectedIndex >= 0 ? Center(child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Image.asset(appConstant.mCategory[selectedIndex].categoryIcons.toString(),color: Colors.green,),
                          Text(appConstant.mCategory[selectedIndex].categoryTitle.toString(),style: TextStyle(fontSize: 18,),),
                        ],
                      ),
                    ),): Center(child: Text('Category',style: TextStyle(fontSize: 18),)),
                  ),
                ),
              ],
            ),
            mSpacer(mHeight: 10),
            InkWell(
              onTap: () async{
                 selectedDateTime = await showDatePicker(barrierDismissible: true ,context: context, firstDate: DateTime(2020), lastDate: DateTime.now());
                 setState(() {

                 });
              },
              child: Container(
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 2.2,color: Colors.grey),
                    color: Color(0xffefefef)
                ),
                child: Center(child: Text(Df.format(selectedDateTime ?? DateTime.now()),style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)), /// here we add date time.
              ),
            ),
          ],
        ),
      ),
    );
  }}