import 'package:employee_self_service_flutter/constant/enum.dart';
import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:employee_self_service_flutter/design/tasks/location/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class LocationView extends StatelessWidget {
  const LocationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ThemeNotifier.of(context, listen: false);
    return Consumer<LocationVm>(builder: (context, data, _) {
      return FlutterMap(
        mapController: data.mapController,
        options: MapOptions(
          center: LatLng(0, 0),
          zoom: 5.0,
        ),
        children: [
          TileLayer(
            tileBuilder: theme.themeMode == ThemeModeType.dark
                ? darkModeTileBuilder
                : null,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          if (data.markerPosition != LatLng(0, 0))
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
                      data.markerPosition.latitude,
                      data.markerPosition.longitude,
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
    });
  }
}
