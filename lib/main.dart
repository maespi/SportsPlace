import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sports_place/profile/profile.dart';
import 'package:sports_place/welcomePage.dart';
import 'access/logIn.dart';
import 'access/signUp.dart';
import './MapsPage.dart';
import 'dataStorage.dart' as global;

void main() {
  runApp(const SportsPlaceApp());
  global.accounts['marc'] = "suu";
  global.profiles["marc"] = global.User('marc', '@email', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tempor ultricies vehicula. Ut et tristique magna. Donec eget lacus aliquam, tempor purus ullamcorper, condimentum tellus. Aliquam eget arcu lacinia, volutpat leo sodales, feugiat mi. Integer ultricies pellentesque elit, non fermentum nunc elementum varius. Praesent id ex volutpat, varius dolor non, egestas lacus. Donec nec risus sed mi mattis pellentesque ac vitae turpis. Aenean scelerisque turpis sed varius fringilla. Praesent venenatis nulla in enim pellentesque faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur nisl nisi, egestas non posuere ut, rhoncus vitae elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas augue est, ultrices ut orci in, accumsan aliquet turpis. Sed ut enim vel lectus tincidunt maximus vel id ante. Quisque feugiat mollis velit non mattis.');
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
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
      //  '/welcome': (context) => const WelcomeApp(user: ,),
      //  '/profile': (context) => const Profile(),
      },
    );
  }
}