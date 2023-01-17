import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_by_fatti extends StatefulWidget {
  @override
  _Map_by_fattiState createState() => _Map_by_fattiState();
}

class _Map_by_fattiState extends State<Map_by_fatti> {
  // Creates a controller to display the Google Map
  Completer<GoogleMapController> _controller = Completer();

  // Initial camera position for the map
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 2,
  );

  // Set of markers displayed on the map
  final Set<Marker> _markers = {};

  void _onMapTapped(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: 'Marker',
            snippet: 'Add or remove by tapping on the map',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                mapType: MapType.normal,
                markers: _markers,
                myLocationEnabled: true,
                compassEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: _onMapTapped,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _markers.clear();
                        });
                      },
                      child: Text('Clear markers'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _onMapTapped(LatLng(0, 0));
                      },
                      child: Text('Add marker'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
