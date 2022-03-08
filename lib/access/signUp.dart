
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../special/dataStorage.dart' as global;

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SignUpForm createState() => _SignUpForm();

}
class _SignUpForm extends State<SignUp>{
  final controllerUser = TextEditingController();
  final controllerPass = TextEditingController();

  @override
  void dispose(){
    controllerUser.dispose();
    controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(
        resizeToAvoidBottomInset:false,
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Image.asset('assets/images/logowhitefull.png'),
              ),
              Container(
                alignment: Alignment.center,
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
                          if (!global.accounts.containsKey(controllerUser.text)){
                            print("User "+controllerUser.text+" Signed Up");
                            global.accounts[controllerUser.text] = controllerPass.text;
                            global.profiles[controllerUser.text] = global.User(controllerUser.text, 'Email', 'User Data');

                            showDialog(context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("User ${controllerUser.text} created correctly"),
                                  );
                                });
                          }else{
                            showDialog(context: context,
                                builder: (context) {
                              return const AlertDialog(
                                content: Text("Error on sign in with that user and password"),
                              );
                                } );
                          }
                          controllerPass.clear();
                          controllerUser.clear();
                        },
                        child: const Text(
                          '   Sign Up   ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: RichText(
                        text: TextSpan(
                          text: 'I already have an account',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}