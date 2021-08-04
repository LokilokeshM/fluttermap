import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_demo/Screen/Services/geolocator_service.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeoLocatorService();

  late Position currentLocation;

  ApplicationBloc() {
    setCurrentLocations();
  }
  setCurrentLocations() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
