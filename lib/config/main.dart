import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sports_place/management/bookings.dart';
import 'package:sports_place/profile/profile.dart';
import 'package:sports_place/config/welcomePage.dart';
import '../access/logIn.dart';
import '../access/signUp.dart';
import '../special/MapsPage.dart';
import '../special/dataStorage.dart' as global;

void main() {
  runApp(const SportsPlaceApp());if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  global.loadData(); //Load Data From File dataStorage
}

class SportsPlaceApp extends StatelessWidget {
  const SportsPlaceApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Place App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(
            53, 36, 61, 0.6196078431372549),
      ),
      debugShowCheckedModeBanner: false,
      //initialRoute and routes allows us to load all widgets in the main app
      // to push them using alias as Navigation.push(alias) we understand '/' as home rute
      initialRoute: '/',
      routes: {
        '/': (context) => const LogIn(title: 'Sports Place'),
        '/login': (context) => const LogIn(title: 'Sports Place'),
        '/signUp': (context) => const SignUp(title: 'Sports Place'),
        '/maps': (context) => const MapSample(),
        '/welcome': (context) => const WelcomeApp(),
        '/profile': (context) => const Profile(),
        '/booking': (context) => const Booking(),
      },
    );
  }
}