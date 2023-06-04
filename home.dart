import 'package:drcar/my_header_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'drawer.dart';
import 'my_header_drawer.dart';

class DefaultPage extends StatefulWidget {
  static const String route = '/';

  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 182, 193, 1),
        title: Text(
          'Dr.Car',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: DrawerWidget(), // إضافة الـ drawer هنا
      body: Center(
        child: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            plugins: <MapPlugin>[
              LocationPlugin(),
            ],
          ),
          layers: <LayerOptions>[
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: <String>['a', 'b', 'c'],
            ),
          ],
          nonRotatedLayers: <LayerOptions>[
            LocationOptions(
              locationButton(),
              onLocationUpdate: (LatLngData? ld) {
                print(
                    'Location updated: ${ld?.location} (accuracy: ${ld?.accuracy})');
              },
              onLocationRequested: (LatLngData? ld) {
                if (ld == null) {
                  return;
                }
                mapController.move(ld.location, 16.0);
              },
            ),
          ],
        ),
      ),
    );
  }

  LocationButtonBuilder locationButton() {
    return (BuildContext context, ValueNotifier<LocationServiceStatus> status,
        Function onPressed) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
          child: FloatingActionButton(
            child: ValueListenableBuilder<LocationServiceStatus>(
              valueListenable: status,
              builder: (BuildContext context, LocationServiceStatus value,
                  Widget? child) {
                switch (value) {
                  case LocationServiceStatus.disabled:
                  case LocationServiceStatus.permissionDenied:
                  case LocationServiceStatus.unsubscribed:
                    return const Icon(
                      Icons.location_disabled,
                      color: Color.fromRGBO(63, 182, 193, 1),
                    );
                  default:
                    return const Icon(
                      Icons.location_searching,
                      color: Color.fromRGBO(63, 182, 193, 1),
                    );
                }
              },
            ),
            onPressed: () => onPressed(),
          ),
        ),
      );
    };
  }
}
