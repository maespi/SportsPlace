
library sports_place.AppData;
import 'package:google_maps_flutter/google_maps_flutter.dart';

//The use of this file is to be used as a database
var accounts = {};
var profiles = {};
var markers = {};
var publishers = {};
User mainUser = User("", "", "");

class User {
  final String Name;
  final String Email;
  final String About;

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
  profiles["marc"] = User('marc', '@email', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempor ultricies vehicula. Ut et tristique magna. Donec eget lacus aliquam, tempor purus ullamcorper, condimentum tellus. Aliquam eget arcu lacinia, volutpat leo sodales, feugiat mi. Integer ultricies pellentesque elit, non fermentum nunc elementum varius. Praesent id ex volutpat, varius dolor non, egestas lacus. Donec nec risus sed mi mattis pellentesque ac vitae turpis. Aenean scelerisque turpis sed varius fringilla. Praesent venenatis nulla in enim pellentesque faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nisl nisi, egestas non posuere ut, rhoncus vitae elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas augue est, ultrices ut orci in, accumsan aliquet turpis. Sed ut enim vel lectus tincidunt maximus vel id ante. Quisque feugiat mollis velit non mattis.');


  markers['marker1'] = CustomMarker("ARTÓS SPORTS CLUB", 'marker1',
      4.2, const LatLng(41.393538, 2.176174),'C/ dels Vergós 67, 08017, Barcelona' ,'10:30', '20:15');
  markers['marker2'] = CustomMarker("CLUB TENNIS BARCINO", 'marker2',
      3.5, const LatLng(41.408698, 2.138305),'Plaça de Narcisa Freixas, 2, Barcelona' ,'8:00', '21:20');

  publishers['marker1'] = Publisher('marker1',"ARTÓS SPORTS CLUB",{'futbol':[Offer('1','10:30 - 11:30',13,true),Offer('2','14:30 - 12:30',55,true)]});
  publishers['marker2'] = Publisher('marker2',"CLUB TENNIS BARCINO",{'tenis':[Offer('3','11:30 - 12:30',20,true),Offer('4','15:30 - 16:30',80,true)],
    'futbol':[Offer('5','9:00 - 11:30',17,true),Offer('6','16:00 - 18:30',40,true)]});
}