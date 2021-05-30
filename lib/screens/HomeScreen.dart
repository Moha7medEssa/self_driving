import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'LogInScreen.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _changeItem(int value){
    print(value);
    setState(() {
      _currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Image(image: AssetImage("images/prof.jpg"),
                    height: 100,
                    width: 100,),
                  Text('Mohamed.Said1912@yahoo.com', style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
              },
            ),
            ListTile(
              title: Text('about Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('FeedBack'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Get Info..'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('SoftWare'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('HardWare'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Embdeed Computer'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Help you ?'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ) ,
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                LogOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LogInScreen()));
              },
              icon: Icon(Icons.person),
              label: Text("Log Out"))
        ],
        title: Text('My Car',
          style:
          TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow),textAlign: TextAlign.center,),
      ),
      body: Column(
        children: [
          Expanded(child:Container(
              width: double.infinity,
            child: Image.network('https://img.drivemag.net/media/default/0001/43/2018-Range-Rover-Evoque-Landmark-Edition-0-4473-default-large.jpeg')
          ), ),
          Expanded(child: Container(
            child: Row(
              children: [
                Icon(Icons.lock_open_rounded,color: Colors.black,size: 100,),
                SizedBox(width: 20,),
                Icon(Icons.settings_power_rounded,color: Colors.black,size: 100,),
                SizedBox(width: 20,),
                Icon(Icons.lock_rounded,color: Colors.black,size: 100,),
              ],
            ),
            color: Colors.white,
            width: double.infinity,
          ),),
          Expanded(child: Row(
            children: [
              Expanded(
                child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Future of Driving',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
    SizedBox(height: 15,),
    Text(' Autopilot advanced safety'
        '  and convenience features'
        '  are designed to assist you'
        '  with the most burdensome'
        '  parts of driving',style: TextStyle(),),
                ],
              )
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Quickest Acceleration',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                      SizedBox(height: 15,),
                      Icon(Icons.electric_car,size: 76,),
                    ],
                  )
              )
            ],
          ),),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home),
          Icon(Icons.add_location_alt_outlined),
          Icon(Icons.search),
          Icon(Icons.article_sharp),
          Icon(Icons.settings_applications),
        ],
        onTap: _changeItem,
        index: _currentIndex,
      ),
    );
  }
}

class LogOut {
}


