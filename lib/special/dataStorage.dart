
library sports_place.AppData;
import 'package:google_maps_flutter/google_maps_flutter.dart';

//The use of this file is to be used as a database
var accounts = {};
var profiles = {};
var markers = {};
var pMarkers = {};
var publishers = {};
User mainUser = User("", "", "");

class User {
  String Name;
  final String Email;
  String About;

  User(this.Name, this.Email, this.About);
}

class CustomMarker{
  final String name;
  final String id;
  final double punt;
  final LatLng coord;
  final String dir;
  final String opensH;
  final String closesH;

  CustomMarker(this.name, this.id, this.punt, this.coord, this.dir,this.opensH, this.closesH);
}
class Offer{
  final String id;
  final String time;
  final int price;
  bool available;



  Offer(this.id, this.time, this.price, this.available);
}

class Publisher{
  final String id;
  final String name;
  final Map<String,List<Offer>> offers;

  Publisher(this.id, this.name, this.offers);
}

void loadData(){

  accounts['marc'] = "suu";
  profiles["marc"] = User('Name', 'marc', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempor ultricies vehicula. Ut et tristique magna. Donec eget lacus aliquam, tempor purus ullamcorper, condimentum tellus. Aliquam eget arcu lacinia, volutpat leo sodales, feugiat mi. Integer ultricies pellentesque elit, non fermentum nunc elementum varius. Praesent id ex volutpat, varius dolor non, egestas lacus. Donec nec risus sed mi mattis pellentesque ac vitae turpis. Aenean scelerisque turpis sed varius fringilla. Praesent venenatis nulla in enim pellentesque faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nisl nisi, egestas non posuere ut, rhoncus vitae elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas augue est, ultrices ut orci in, accumsan aliquet turpis. Sed ut enim vel lectus tincidunt maximus vel id ante. Quisque feugiat mollis velit non mattis.');

  accounts['temp@'] = "temp";
  profiles["temp@"] = User('Temp User', 'temp@', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempor ultricies vehicula. Ut et tristique magna. Donec eget lacus aliquam, tempor purus ullamcorper, condimentum tellus. Aliquam eget arcu lacinia, volutpat leo sodales, feugiat mi. Integer ultricies pellentesque elit, non fermentum nunc elementum varius. Praesent id ex volutpat, varius dolor non, egestas lacus. Donec nec risus sed mi mattis pellentesque ac vitae turpis. Aenean scelerisque turpis sed varius fringilla. Praesent venenatis nulla in enim pellentesque faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nisl nisi, egestas non posuere ut, rhoncus vitae elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas augue est, ultrices ut orci in, accumsan aliquet turpis. Sed ut enim vel lectus tincidunt maximus vel id ante. Quisque feugiat mollis velit non mattis.');


  markers['marker1'] = CustomMarker("ARTÓS SPORTS CLUB", 'marker1',
      4.2, const LatLng(41.393538, 2.176174),'Carrer dels Vergós, 67, Barcelona' ,'10:30', '20:15');
  markers['marker2'] = CustomMarker("CLUB TENNIS BARCINO", 'marker2',
      3.5, const LatLng(41.408698, 2.138305),'Plaça Freixas, 2, Barcelona' ,'8:00', '21:20');
  markers['marker3'] = CustomMarker("CLUB CONGRES", 'marker3',
      4.8, const LatLng(41.426820, 2.191609),'Carrer de Berenguer, 145, Barcelona' ,'8:00', '21:20');

  pMarkers['pMarker1'] = CustomMarker("Plaça de les Glories", 'pMarker1',
      4.8, const LatLng(41.404221, 2.187211),'Pista basket, Plaça Glories Catalanes, Barcelona' ,'8:00', '21:20');
  pMarkers['pMarker2'] = CustomMarker("Parc de la Ciutadella - Tenis Taula", 'pMarker2',
      4.1, const LatLng(41.390706, 2.186458),'Passeig de Picasso, 21, Barcelona' ,'8:00', '21:20');


  publishers['marker1'] = Publisher('marker1',"ARTÓS SPORTS CLUB",{'soccer':[Offer('1','10:30 - 11:30',20,true),Offer('2','14:30 - 15:30',20,true)],
    'tennis':[Offer('3','11:30 - 12:30',55,true),Offer('4','15:30 - 16:30',55,true)],
    'basketball':[Offer('5','16:30 - 17:30',30,true),Offer('6','17:30 - 18:30',30,true)]});

  publishers['marker2'] = Publisher('marker2',"CLUB TENNIS BARCINO",{
    'tennis':[Offer('7','11:30 - 12:30',64,true),Offer('8','15:30 - 16:30',64,true),Offer('9','16:30 - 17:30',80,true),Offer('10','17:30 - 18:30',80,true)],
    'soccer':[Offer('11','9:00 - 10:00',20,true),Offer('12','16:00 - 17:00',20,true)],
    'hockey':[Offer('13','10:00 - 11:00',40,true),Offer('14','18:00 - 19:00',40,true)]
  });

  publishers['marker3'] = Publisher('marker3',"CLUB CONGRES",{
    'hockey':[Offer('15','11:30 - 12:30',34,true),Offer('16','15:30 - 16:30',34,true),Offer('17','16:30 - 17:30',34,true),Offer('18','17:30 - 18:30',34,true)],
    'soccer':[Offer('19','9:00 - 10:00',20,true),Offer('20','16:00 - 17:00',20,true)]
  });
}