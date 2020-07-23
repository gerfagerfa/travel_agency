import 'package:flutter/material.dart';
import 'package:travel_agency/constants.dart';

Widget bottomNavigatorItem(IconData iconData){
  return Container(
    width: 50,
    child: Stack(
      children: <Widget>[

        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 40,
            height: 3,
            color: kPrimaryColor,
          ),
        ),

        Center(
          child: Icon(
            iconData,
            color: kPrimaryColor,
            size: 32,
          ),
        )

      ],
    ),
  );
}