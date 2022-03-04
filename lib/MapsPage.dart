
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.403800, 2.193262),
    zoom: 14.4746,
  );

  static const CameraPosition _kBar = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(41.392066, 2.174683),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheBar,
        label: const Text('To the Bar!'),
        icon: const Icon(Icons.local_drink),
      ),
    );
  }

  Future<void> _goToTheBar() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kBar));
  }
}