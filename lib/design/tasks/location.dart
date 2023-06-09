
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  LocationViewState createState() => LocationViewState();
}

class LocationViewState extends State<LocationView> {
  final MapController _mapController = MapController();
  LatLng _markerPosition = LatLng(0, 0);
  String currentAddress = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _markerPosition = LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        );
      });
      _mapController.move(_markerPosition, 15.0);
    } catch (e) {
      log(e.toString());
    }
  }

/*

  void _updateAddress(LatLng position) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placeMarks.isNotEmpty) {
        setState(() {
          Placemark currentPlaceMark = placeMarks[0];
          currentAddress = currentPlaceMark.street ?? '';
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(0, 0),
        zoom: 5.0,
      ),
      children: [
        TileLayer(
          backgroundColor: Colors.black,
          tileBuilder: darkModeTileBuilder,
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        if (_markerPosition != LatLng(0, 0))
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 45,
              size: const Size(40, 40),
              anchor: AnchorPos.align(AnchorAlign.top),
              fitBoundsOptions: const FitBoundsOptions(
                padding: EdgeInsets.all(50),
                maxZoom: 15,
              ),
              markers: <Marker>[
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(
                    _markerPosition.latitude,
                    _markerPosition.longitude,
                  ),
                  builder: (BuildContext context) {
                    return const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50,
                    );
                  },
                ),
              ],
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
