import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding_resolver/geocoding_resolver.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationVm extends ChangeNotifier {
  final MapController mapController = MapController();
  LatLng markerPosition = LatLng(0, 0);
  String? address;

  Future<void> getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      notifyListeners();
      markerPosition = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      mapController.move(markerPosition, 15.0);
      GeoCoder geoCoder = GeoCoder();
      Address location = await geoCoder.getAddressFromLatLng(
          latitude: currentPosition.latitude,
          longitude: currentPosition.longitude);
      address = location.displayName;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  LocationVm() {
    _initialize();
  }

  Future<void> _initialize() async {
    await getCurrentLocation();
    notifyListeners();
  }
}
