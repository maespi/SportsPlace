
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../special/dataStorage.dart';
import '../config/welcomePage.dart';
import '../special/dataStorage.dart' as global;


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final controllerUser = TextEditingController();
  final controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Image.asset('assets/images/logowhitefull.png'),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10),
                    margin: EdgeInsets.only(left: 40, right: 40, top: MediaQuery.of(context).size.height*0.05),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 30), bottom: Radius.elliptical(20, 30)),
                      color: Color.fromRGBO(
                          53, 36, 61, 1),
                    ),
                    child: Column(children: [
                      Padding(padding: const EdgeInsets.only(top: 0),
                        child: TextField(
                          controller: controllerUser,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(27.5),
                            ),
                            hintText: 'Email address',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 20),
                        child: TextField(
                          controller: controllerPass,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(27.5),
                            ),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(30, 30, 30, 0.5)),
                          ),
                          onPressed: () {
                            if (global.accounts.containsKey(controllerUser.text) && global.accounts[controllerUser.text] == controllerPass.text){
                              User user = global.profiles[controllerUser.text];
                              print("User has connected: "+user.Name);
                              global.mainUser = user;
                              //Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);// We delete the current path to avoid problems with the menu in login pages
                              Navigator.pushNamed(context, '/welcome');
                            }else{
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      content: Text("Error on sign in with that user and password"),
                                    );
                                  });
                            }
                            controllerPass.clear();
                            controllerUser.clear();
                          },
                          child: const Text(
                            '   Log In   ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: RichText(
                          text: TextSpan(
                            text: 'I do not have an account',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, '/signUp'),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}