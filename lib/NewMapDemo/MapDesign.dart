// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map_demo/NewMapDemo/MarkerFile.dart';

class MapDemo extends StatelessWidget {
  var _controller;
  MapDemo(Completer<GoogleMapController> _controller);

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {...(markers as List<Marker>).toList()},
      ),
    );
  }

  // Widget _zoomminusfunctions() {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //       icon: Icon(FontAwesomeIcons.searchMinus),
  //       color: Colors.amberAccent,
  //       onPressed: () {
  //         zoomVal--;
  //         _minus(zoomVal);
  //       },
  //     ),
  //   );
  // }

  // Widget _zoomplusfunction() {
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: IconButton(
  //       icon: Icon(FontAwesomeIcons.plus),
  //       color: Colors.amberAccent,
  //       onPressed: () {
  //         zoomVal++;
  //         _plus(zoomVal);
  //       },
  //     ),
  //   );
  // }

  // Future<void> _minus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  // }

  // Future<void> _plus(double zoomVal) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  // }
}
