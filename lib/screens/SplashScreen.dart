import 'dart:async';

import 'package:flutter/material.dart';

import 'LogInScreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NavigateToLogIn();
    // Add code after super
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyImage(),
                  SizedBox(height: 40,),
                  Text("Self Driving Car",style: TextStyle(fontSize: 25),),
                ],
              ) ,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 20,),
                  Text("Go to start app",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  void NavigateToLogIn(){
    Timer(Duration(seconds: 5),()=>Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) =>LogInScreen())
    ));

  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = new AssetImage('images/mercides.jpg');
    // ignore: non_constant_identifier_names
    Image Logo = new Image(image: image,width: 150,height: 150,);
    return Logo;
  }
}
