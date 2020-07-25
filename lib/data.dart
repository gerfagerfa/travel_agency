import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.settings),
    NavigationItem(Icons.person),
  ];
}

class Place {

  String description;
  String country;
  double price;
  List<String> images;
  bool favorite;

  Place(this.description, this.country, this.price, this.images, this.favorite);

}

List<Place> getPlaceList(){
  return <Place>[
    Place(
      "These red cabins are beautiful",
      "Norway",
      4055,
      [
        "assets/images/cabins_0.jpg"
      ],
      false
    ),
    Place(
      "Beautiful city view from top of the town",
      "Norway",
      3580.9,
      [
        "assets/images/top_of_the_town_0.jpg"
      ],
      false
    ),
  ];
}

class Destination {

  String city;
  String country;
  String iconUrl;
  Color iconColor;

  Destination(this.city, this.country, this.iconUrl, this.iconColor);

}

List<Destination> getDestinationList(){
  return <Destination>[
    Destination(
      "New York",
      "USA",
      "assets/icons/statue_of_liberty.png",
      Color(0xFFFF8412),
    ),
    Destination(
      "Paris",
      "France",
      "assets/icons/tower_eiffel.png",
      Color(0xFF2FC069),
    ),
    Destination(
      "Sydney",
      "Australia",
      "assets/icons/temple.png",
      Color(0xFF18A2EF),
    ),
  ];
}