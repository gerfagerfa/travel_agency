import 'package:flutter/material.dart';
import 'package:travel_agency/constants.dart';
import 'package:travel_agency/data.dart';

Widget bottomNavigatorItem(NavigationItem item, bool selected){
  return Container(
    width: 50,
    child: Stack(
      children: <Widget>[

        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 40,
            height: 3,
            color: selected ? kPrimaryColor : Colors.transparent,
          ),
        ),

        Center(
          child: Icon(
            item.iconData,
            color: selected ? kPrimaryColor : Colors.grey[400],
            size: 32,
          ),
        )

      ],
    ),
  );
}