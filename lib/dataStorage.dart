
library sports_place.AppData;

import 'package:google_maps_flutter/google_maps_flutter.dart';
//The use of this file is to be used as a database
var accounts = {};
var profiles = {};
var markers = {};
User mainUser = User("", "", "");

class User {
  final String Name;
  final String Email;
  final String About;

  User(this.Name, this.Email, this.About);
}

class CustomMarker{
  final String Name;
  final String id;
  final int punt;
  final LatLng Coord;
  final String opensH;
  final String closesH;

  CustomMarker(this.Name, this.id, this.punt, this.Coord, this.opensH, this.closesH);
}