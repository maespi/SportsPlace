
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sports_place/config/welcomePage.dart';
import 'package:sports_place/profile/profile.dart';
import '../special/dataStorage.dart' as global;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfileDisplayState();
}

class EditProfileDisplayState extends State<EditProfile> {


  final cName = TextEditingController();
  final cAbout = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(
            53, 36, 61, 1),
        body: Center(
          child: Flexible(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: const Icon(CupertinoIcons.camera_circle, size: 200, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: cName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(27.5),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.lightBlue)
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: cAbout,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(27.5),
                        ),
                        labelText: 'Personal information about the user',
                        labelStyle: TextStyle(color: Colors.lightBlue)
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed:  (){
                          global.profiles[global.mainUser.Email].Name = cName.value.text.toString();
                          global.profiles[global.mainUser.Email].About = cAbout.value.text.toString();
                          global.mainUser = global.profiles[global.mainUser.Email];
                          Navigator.pop(context);
                          /*Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                          const WelcomeApp()));*/
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(30, 30, 30, 0.5)),
                        ),
                        child: const Text(
                          '   Save   ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }

}