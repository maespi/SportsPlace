import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sports_place/special/dataStorage.dart' as global;
import 'package:sports_place/management/shopSchedule.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {

  bool _light = true;
  @override
  Widget build(BuildContext context) {

    return SafeArea(child:
        Scaffold(
          backgroundColor: const Color.fromRGBO(
            53, 36, 61, 1),
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        text: "Settings",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        )
                    )
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  /*crossAxisAlignment: CrossAxisAlignment.stretch,*/
                  children: [
                    RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                            text: "Light/Dark theme",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            )
                        )),
                    const SizedBox(width: 95),
                    Switch(
                      value: _light,
                      onChanged: (value) {
                        setState(() {
                          _light = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Language:\t',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              )
                          ))
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 75),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.25,
                        child: const TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'English',
                            filled: true,
                            fillColor: Color.fromRGBO(101, 97, 134, 0.7),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(),
                            isCollapsed: true,
                          ),
                        ),
                      )
                  )
                ],
              ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text: 'Badge:      \t',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                )
                            ))
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 75),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.25,
                          child: const TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 5),
                              hintText: 'USD (\$)',
                              filled: true,
                              fillColor: Color.fromRGBO(101, 97, 134, 0.7),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(),
                              isCollapsed: true,
                            ),
                          ),
                        )
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color:Color.fromRGBO(101, 97, 134, 0.7),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 40),
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                                text: 'Account Email:\t',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                )
                            ))
                    ),
                    Padding(padding: const EdgeInsets.only(right: 40),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.25,
                          child: Text(global.mainUser.Email,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                            ),
                          )
                        )
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text: 'Change password',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,

                                )
                            ))
                    ),
                    const Padding(padding: EdgeInsets.only(right: 70, left: 20),
                        child: SizedBox(
                          child: Text("*******",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                    )
                  ],
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color:Color.fromRGBO(101, 97, 134, 0.7),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                    ),
                    child: const Image(
                      image: AssetImage(
                          'assets/images/custSupp.png'
                      ),
                    ),
                  ),
                  ],
                )
              ],
            ),
          )
        )
    );
  }

}