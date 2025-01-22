
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monety_ui/Database/dbHelper/expanseDbHelper.dart';
import 'package:monety_ui/Database/models/userModels.dart';
import '';
/// Register  page design
class RegisterPage extends StatelessWidget{
  TextEditingController _emailId = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _ConfirmPassword = TextEditingController();
  DbHelper dbHelper = DbHelper.getInstance();
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
                height: 300,
                decoration: BoxDecoration(
                  // color: Colors.lightBlue,
                    image: DecorationImage(fit: BoxFit.cover,image: AssetImage('Assets/images/register.png'))
                ),
              ),
              Text('Register Now',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,fontFamily: 'subfonts'),),
              SizedBox(height: 5,),
              Text('Please enter you details below to continue.',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,fontFamily: 'H1fonts',color: Colors.grey),),
              SizedBox(height: 20),
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
                      controller: _userName,style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'User name',
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
                      controller: _emailId,style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'abcde123@gmail.com',
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
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  controller: _password,style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Create a password',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      suffixIcon: Icon(Icons.visibility_off),
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
                  controller: _ConfirmPassword,style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Confirm your password',
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
                ],
              ),
              SizedBox(height: 15,),
              Container(
                width: 330,
                height: 60,
                child: ElevatedButton(onPressed: () async {
                  /// register operation
                   if(!await dbHelper.isUserAlreadyRegister(email:_emailId.text )){
                     userModels newUser = userModels(userName: _userName.text, userEmail: _emailId.text, userPassword: _password.text, userCreatedDate: DateTime.now().millisecondsSinceEpoch.toString());
                   bool check = await dbHelper.registerUser(user: newUser );
                   if(check){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Successfully register, Login now !')));
                     Navigator.pop(context);
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Successfully not  register, some things worng please try again !')));
                   }
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User all ready register!!')));  /// this show the massage when user register.
                   }
                  print('here we do login button action #');
                }, child: Text('REGISTER',style: TextStyle(fontSize: 22,fontFamily: 'subfonts'),)),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}