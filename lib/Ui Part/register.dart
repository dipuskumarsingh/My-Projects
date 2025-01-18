
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/// Register  page design
class RegisterPage extends StatelessWidget{
  TextEditingController emailId = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();
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
                      controller: userName,style: TextStyle(fontSize: 20),
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
                      controller: emailId,style: TextStyle(fontSize: 20),
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
                  controller: password,style: TextStyle(fontSize: 20),
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
                  controller: ConfirmPassword,style: TextStyle(fontSize: 20),
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
                child: ElevatedButton(onPressed: (){
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