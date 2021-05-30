import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  String email="";
  var _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Forget Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white70,
      body: Center(
        child: Padding(padding: EdgeInsets.only(top:50, left: 20, right: 20 ),

          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("please click on link to rest your password",
                  style: TextStyle(color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Theme(
                  data: ThemeData(
                      highlightColor: Colors.blue
                  ),
                  child: Padding(padding: EdgeInsets.only(top:30 ),
                    child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "please your email";
                        }else{
                          email = value;
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: ("Email"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffff2fc3),width: 1)
                          )
                      ),
                    ),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.only(top:20 ,left: 30,right: 30),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          FirebaseAuth.instance.sendPasswordResetEmail(email:email).then((value) => print("Check your mail"));
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.yellow,
                      child:Text("Send Email",style: TextStyle(color: Colors.blue,
                          fontWeight: FontWeight.bold,fontSize: 20),),
                      padding: EdgeInsets.all(10),
                    )


                )],
            ),
          ),
        ),
      ),
    );
  }
}
