// ignore_for_file: file_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildContainer extends StatefulWidget {
  var _controller;
  BuildContainer(Completer<GoogleMapController> _controller);
  @override
  _BuildContainerState createState() => _BuildContainerState(_controller);
}

class _BuildContainerState extends State<BuildContainer> {
  var _controller;
  _BuildContainerState(_controller);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380,
                  -73.988426,
                  "Gramercy Tavern",
                  _controller),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421,
                  -73.981667,
                  "Le Bernardin",
                  _controller),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128,
                  -73.999619,
                  "Blue Hill",
                  _controller),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _boxes(String _image, double lat, double long, String restaurantName,
    var _controller) {
  return GestureDetector(
    onTap: () {
      _gotoLocation(lat, long, _controller);
    },
    child: Container(
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(restaurantName),
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}

Widget myDetailsContainer1(String restaurantName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Text(
          restaurantName,
          style: TextStyle(
              color: Color(0xff6200ee),
              fontSize: 24.0,
              fontWeight: FontWeight.bold),
        )),
      ),
      SizedBox(height: 5.0),
      Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: Text(
            "4.1",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
            child: Icon(
              FontAwesomeIcons.solidStarHalf,
              color: Colors.amber,
              size: 15.0,
            ),
          ),
          Container(
              child: Text(
            "(946)",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
            ),
          )),
        ],
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
        ),
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "Closed \u00B7 Opens 17:00 Thu",
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Future<void> _gotoLocation(
    double lat, double long, Completer<GoogleMapController> _controller) async {
  final GoogleMapController controller = await _controller.future;
  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0)));
}
