
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dataStorage.dart' as global;
import '../management/shopSchedule.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  final showCard = <Widget>[];
  List<Marker> markers = [];
  @override
  void initState(){
    super.initState();

    
    for (var element in global.markers.values) {
      Marker _tmp = Marker(
          markerId: MarkerId(element.id.toString()),
          position: element.coord,
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          onTap: () {
            _onMarkerPressed(element.id, false);
          }
          );
      markers.add(_tmp);
    }
    for (var element in global.pMarkers.values) {
      Marker _tmp = Marker(
          markerId: MarkerId(element.id.toString()),
          position: element.coord,
          draggable: false,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            _onMarkerPressed(element.id, true);
          }
      );
      markers.add(_tmp);
    }
  }

  static const CameraPosition _mapCenter = CameraPosition(
    target: LatLng(41.403800, 2.193262),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
        Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(child: GoogleMap(
            mapType: MapType.normal,
            liteModeEnabled: false,
            initialCameraPosition: _mapCenter,
            markers: Set.from(markers),
            onTap: (none){
              setState(() {
                if (showCard.isNotEmpty) {
                  showCard.clear();
                }
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )),
        ] + showCard,
      )
    );
  }

  void _onMarkerPressed(String id ,bool public){
    global.CustomMarker marker;

    if(!public){
      marker = global.markers[id];
    }else{
      marker = global.pMarkers[id];
    }

    var card = Positioned.fill(
        top: MediaQuery.of(context).size.height*0.65,
        child:
        Container(
            margin: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(32.5, 32.5)),
              color: Color.fromRGBO(20, 20, 20, 1),
            ),
            child:
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 3),
                    child:Image(
                      image: Image.asset('assets/images/pista1.png').image,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Flexible(child:
                          RichText(
                            textAlign:TextAlign.center,
                            textDirection: TextDirection.ltr,
                            text: TextSpan(
                              text: marker.name,
                              style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )
                          ),
                          Flexible(child:
                          RichText(
                            textAlign:TextAlign.center,
                            textDirection: TextDirection.ltr,
                            text: TextSpan(
                              text: ('Rating: '+marker.punt.toString()),
                              style: const TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                          ),
                          RichText(
                            textAlign:TextAlign.left,
                            textDirection: TextDirection.ltr,
                            text: TextSpan(
                              text: (marker.dir.toString()),
                              style: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.indigoAccent,
                          ),
                          Row(
                            children: [
                              Flexible(child:
                              RichText(
                                textWidthBasis: TextWidthBasis.parent,
                                overflow: TextOverflow.clip,
                                textAlign:TextAlign.left,
                                text: TextSpan(
                                  text: ('Opens at: ' + marker.opensH + '\n' +
                                      'Closes at: ' + marker.closesH),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )),
                              if(!public)
                                Padding(
                                    padding: const EdgeInsets.only(left: 30,right: 15),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(101, 97, 134, 1)),
                                      ),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSchedule(shopId: id)));
                                      },
                                      child: const Text('VIEW',style: TextStyle(fontSize: 10)),
                                    )
                                )
                            ],
                          )
                        ],
                      )
                  )]
            )
        )
    );
    setState(() {
      //If a marker is pressed and there is any other load, it clears the var for the new entry
      if (showCard.isNotEmpty){
        showCard.clear();
      }
      showCard.add(card);
    });
  }
}