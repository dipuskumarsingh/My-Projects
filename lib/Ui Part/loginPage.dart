

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'register.dart';
import 'dashboard.dart';

/// login page design
///
class loginpage extends StatelessWidget{
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  DbHelper DB = DbHelper.getInstance();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400 ,
                height: 330,
                decoration: BoxDecoration(
                  // color: Colors.lightBlue,
                  image: DecorationImage(fit: BoxFit.cover,image: AssetImage('Assets/images/Login.png'))
                ),
              ),
              Text('Login Now',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,fontFamily: 'subfonts'),),
              SizedBox(height: 5,),
              Text('Please enter you details below to continue.',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,fontFamily: 'H1fonts',color: Colors.grey),),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextField(
                      controller: _emailId,style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'abcde123@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: _password,style: TextStyle(fontSize: 20),
                      obscureText: true,
                      obscuringCharacter: '*',
                      
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: 'Passwords',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      print('here we do forgot operation #');
                    },
                      child: Text('Forgot Password?', style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold,fontFamily: 'H1fonts',color: Colors.red),)),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                width: 330,
                height: 60,
                child: ElevatedButton(onPressed: ()async{
                 bool check = await  DB.authenticateUser(emil: _emailId.text, password: _password.text);
                 if(check){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successfully')));
                 }else{
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Id or Password worng, Please try agin!')));
                 }
                }, child: Text('LOGIN',style: TextStyle(fontSize: 22,fontFamily: 'subfonts'),)),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height:2,
                color: Colors.grey[300],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don\'t have an account! ",style: TextStyle(fontSize: 19,fontFamily: 'subfonts'),),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    }, child: Text("Register",style: TextStyle(fontSize: 22,fontFamily: 'subfonts',color: Colors.red),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}