// ignore_for_file: file_names, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Marker> markers = [newyock1Marker, newyock2Marker];

Marker newyock1Marker = Marker(
    markerId: MarkerId('newyock1'),
    position: LatLng(40.742451, -74.005959),
    infoWindow: InfoWindow(title: 'Los Tacos'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));

Marker newyock2Marker = Marker(
    markerId: MarkerId('newyock2'),
    position: LatLng(40.729640, -74.983518),
    infoWindow: InfoWindow(title: 'Tree Bistro'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));
