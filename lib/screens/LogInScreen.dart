import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:self_driving_car/screens/HomeScreen.dart';
import 'package:self_driving_car/screens/RegisterScreen.dart';
import 'HomeScreen.dart';
import 'ForgetScreen.dart';
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String email ="", password ="";
  var _formkey = GlobalKey<FormState>();
  static FirebaseAuth auth =FirebaseAuth.instance;

  bool get signInState => null;


  Future<String> logIn() async{
    String user = (await auth.signInWithEmailAndPassword(email: email.trim(), password: password)).toString();
    return user;
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  // ignore: non_constant_identifier_names
  Future<void>_GoogleSignIn() async{
    GoogleSignInAccount signInAccount =await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await signInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    FirebaseUser user = (await auth.signInWithCredential(credential)).user;
    print(user);

    setState(() {
      var signInState = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 190,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Text("LogIN",style: TextStyle(color: Color(0xffff2fc3),fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Future of Driving",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
                  ],
                ),
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250)),
                color: Colors.yellow,
              ),
            ),
            Theme(
              data: ThemeData(
                  highlightColor: Colors.blue
              ),
              child: Padding(padding: EdgeInsets.only(top:50 ,right: 20,left: 20 ),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please your email";
                    }else{
                      var email = value;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      )
                  ),
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                  highlightColor: Colors.blue
              ),
              child: Padding(padding: EdgeInsets.only(top:50 ,right: 20,left: 20 ),
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "please your password";
                    }else{
                      var password = value;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: ("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.yellow,width: 1)
                      )
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 20),
                child:  Container(
                  width: double.infinity,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> ForgetScreen()));
                    },
                    child:Text("forget password",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xffff2fc3),
                      ),),
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: RaisedButton(
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                      Future<String> check= logIn();
                      if(check!=null) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => HomeScreen()
                        ));
                      }
                    }

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.yellow,
                  child:Text("Log In",style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,fontSize: 20),),
                  padding: EdgeInsets.all(10),
                )
            ),
            SizedBox(height: 2,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.blue,
            ),
            Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: RaisedButton(
                onPressed: (){
                  _GoogleSignIn();
                  if(signInState){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context)=>HomeScreen()));
                  }
                },
                color: Colors.white,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google,color: Colors.red,),
                    SizedBox(width: 10,),
                    Text("sign in with google",style: TextStyle(
                        fontSize: 20,color: Color(0xff000725)
                    ),)
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.twitter,color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text("sign with twitter",style: TextStyle(
                        fontSize: 20,color: Color(0xff000725)
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                  children: <Widget>[
                    FlatButton(onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)=> Register())
                      );

                    },
                      child:Column(
                        children: <Widget>[
                          Text("Register",style: TextStyle(
                            fontWeight: FontWeight.bold,
                              color: Colors.blue
                          ),),


                          Container(
                            width: 45,
                            height: 1,
                            color: Colors.blue,
                          )
                        ],
                      ),

                    )
                  ]

              ),

            ),
          ],
        ),
      ),
    );
  }

}
