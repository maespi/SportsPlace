
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../special/dataStorage.dart' as global;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileDisplayState();
}

class ProfileDisplayState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(
              53, 36, 61, 1),
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: const Icon(CupertinoIcons.camera_circle_fill, size: 200),  //  TODO: Transform in a real image!
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    global.mainUser.Name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    global.mainUser.Email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 35,
                  thickness: 1,
                  indent: 35,
                  endIndent: 20,
                  color: Colors.black,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Text(
                    'ABOUT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 5),
                  width: 300.0,
                  height: 100.0,
                  child:
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,//.horizontal
                      child: RichText(
                        textAlign:TextAlign.justify,
                        textDirection: TextDirection.ltr,
                        text: TextSpan(
                          text: global.mainUser.About,
                          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontStyle: FontStyle.normal),
                      ),
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 35,left:35),

                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(30, 30, 30, 0.5)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '   Edit Profile  ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,right: 30, left: 30),
                  child: RichText(
                    text: TextSpan(
                      text: 'SHARE YOUR SOCIAL',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () => showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text("TODO"),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}