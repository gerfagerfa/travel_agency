import 'package:flutter/material.dart';
import 'package:travel_agency/constants.dart';
import 'package:travel_agency/data.dart';
import 'package:travel_agency/detail.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  List<Place> places = getPlaceList();
  List<Destination> destinations = getDestinationList();
  List<Featured> featureds = getFeaturedList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomPadding: false,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16,),
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

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 8, left: 16,),
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildPlaces(),
              ),
            ),
          ),

          Container(
            height: 120,
            padding: EdgeInsets.only(top: 8, left: 16,),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: buildDestinations(),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
            child: Text(
              "Featured Places",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            height: 90,
            child: PageView(
              physics: BouncingScrollPhysics(),
              children: buildFeatureds(),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildPlaces(){
    List<Widget> list = [];
    for (var place in places) {
      list.add(buildPlace(place));
    }
    return list;
  }

  Widget buildPlace(Place place){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(place: place)),
        );
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Hero(
          tag: place.images[0],
          child: Container(
            width: 230,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(place.images[0]), 
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[

                GestureDetector(
                  onTap: () {
                    setState(() {
                      place.favorite = !place.favorite;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, top: 12,),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        place.favorite ? Icons.favorite : Icons.favorite_border,
                        color: kPrimaryColor,
                        size: 36,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 12, right: 12,),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        
                        Text(
                          place.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(
                          height: 8,
                        ),

                        Row(
                          children: <Widget>[
                            
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 20,
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            Text(
                              place.country,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildDestinations(){
    List<Widget> list = [];
    for (var destination in destinations) {
      list.add(buildDestination(destination));
    }
    return list;
  }

  Widget buildDestination(Destination destination){
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        width: 140,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.asset(
                destination.iconUrl,
                height: 32,
                fit: BoxFit.fitHeight,
                color: destination.iconColor,
              ),

              SizedBox(
                height: 4,
              ),

              Text(
                destination.city,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 4,
              ),

              Text(
                destination.country,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildFeatureds(){
    List<Widget> list = [];
    for (var featured in featureds) {
      list.add(buildFeatured(featured));
    }
    return list;
  }

  Widget buildFeatured(Featured featured){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12,),
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featured.imageUrl), 
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  featured.year,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                SizedBox(
                  height: 4,
                ),

                Text(
                  featured.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 3,
                color: selectedItem == item ? kPrimaryColor : Colors.transparent,
              ),
            ),

            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 28,
              ),
            )

          ],
        ),
      ),
    );
  }

}