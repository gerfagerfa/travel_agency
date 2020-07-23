import 'package:flutter/material.dart';
import 'package:travel_agency/constants.dart';
import 'package:travel_agency/bottom_navigator_item.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, //kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Explore",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[

          Container(
            margin: EdgeInsets.only(right: 16, top: 8,),
            width: 50,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),

        ],
      ),      
      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0, 
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 24.0, left: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                    size: 26,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            bottomNavigatorItem(Icons.home),
            bottomNavigatorItem(Icons.notifications),

            Container(
              width: 60,
            ),

            bottomNavigatorItem(Icons.settings),
            bottomNavigatorItem(Icons.person),

          ],
        ),
      ),
    );
  }
}