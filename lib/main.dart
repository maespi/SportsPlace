import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(
            53, 36, 61, 0.6196078431372549),
      ),
      home: const MyHomePage(title: 'Sports Place'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
        Scaffold(
          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Image.asset('assets/images/logowhitefull.png'),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 30), bottom: Radius.elliptical(20, 30)),
                    color: Color.fromRGBO(
                        53, 36, 61, 1),
                  ),
                  child: Column(children: [
                    Padding(padding: const EdgeInsets.only(top: 0),
                      child: TextField(
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
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const MyHomePage( title: "Le button"))); //TODO: SIGN UP FUNCTION
                        },
                        child: const Text(
                          '   Sign Up   ',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: RichText(
                        text: TextSpan(
                          text: 'I already have an account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () => print("TODO"), //TODO: Already HAVE AN ACCOUNT
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
/*floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),*/ // This trailing comma makes auto-formatting nicer for build methods.