import 'package:flutter/material.dart';
import 'package:travel_agency/constants.dart';
import 'package:travel_agency/data.dart';

class Detail extends StatefulWidget {

  final Place place;

  Detail({@required this.place});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  int _currentImage = 0;

  List<Widget> buildPageIndicator(){
    List<Widget> list = [];
    for (var i = 0; i < widget.place.images.length; i++) {
      list.add(i == _currentImage ? buildIndicator(true) : buildIndicator(false));
    }
    return list;
  }

  Widget buildIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: 4.0,
      width: isActive ? 24.0 : 12.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: <Widget>[

              Hero(
                tag: widget.place.images[0],
                child: PageView(
                  onPageChanged: (int page){
                    setState(() {
                      _currentImage = page;
                    });
                  },
                  children: widget.place.images.map((image) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image), 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.place.favorite = !widget.place.favorite;
                        });
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          widget.place.favorite ? Icons.favorite : Icons.favorite_border,
                          color: kPrimaryColor,
                          size: 36,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      child: Text(
                        widget.place.description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        Row(
                          children: <Widget>[

                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 24,
                            ),

                            SizedBox(
                              width: 8,
                            ),

                            Text(
                              widget.place.country,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),

                          ],
                        ),

                        widget.place.images.length > 1
                        ? Row(
                          children: buildPageIndicator(),
                        )
                        : Container(),

                      ],
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Row(
                      children: <Widget>[

                        Text(
                          "Starting from",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(
                          width: 8,
                        ),

                        Text(
                          r"$ " + widget.place.price.toStringAsFixed(2),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 8,),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}