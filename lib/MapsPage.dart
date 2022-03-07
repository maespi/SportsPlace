
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './dataStorage.dart' as global;

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];
  @override
  void initState(){
    super.initState();
    global.markers['marker1'] = global.CustomMarker("Artós Sports Club", 'marker1',
        4, const LatLng(41.393538, 2.176174), '', '');
    markers.add(Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(41.393538, 2.176174),
        draggable: false,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          _onButtonPressed('marker1');
          print("Tapped");
        }
    ),
    );
  }


  static const CameraPosition _mapCenter = CameraPosition(
    target: LatLng(41.403800, 2.193262),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Positioned.fill(child: GoogleMap(
          mapType: MapType.normal,
          liteModeEnabled: false,
          initialCameraPosition: _mapCenter,
          markers: Set.from(markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )),
        Positioned(
          top: MediaQuery.of(context).size.height*0.75,
          child:
            Container(
              color: Colors.green,
              alignment: Alignment.bottomCenter,
              child:
              Padding(
                padding: EdgeInsets.all(50),
                child: RichText(
                  textAlign:TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                      text: global.markers['marker1'].Name,
                      style: TextStyle(color: Colors.black)
                  ),
                ),
              ),
            )

        )
      ],
    );
  }

  Future<void> _goToTheBar() async {
    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(_kBar));
  }

  void _onButtonPressed(String id){
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            /*children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: RichText(
                  textAlign:TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                    text: global.markers[id].Name,
                    style: TextStyle(color: Colors.black)
                  ),
                ),
              ),
            ],*/
          );
    });
  }
}