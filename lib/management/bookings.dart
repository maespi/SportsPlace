
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_place/special/dataStorage.dart' as global;
import 'package:sports_place/management/shopSchedule.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => BookingState();
}

class BookingState extends State<Booking> {

  final cards = <Widget>[];

  void bookingsLoader(){
    setState(() {
      cards.clear();
    });
    for(var publisher in global.publishers.keys) {
      for (var sport in global.publishers[publisher].offers.keys) {
        for (var off in global.publishers[publisher].offers[sport]) {
          if(!off.available){
            var booking = Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 20), bottom: Radius.elliptical(20, 20)),
                color: Color.fromRGBO(
                    32, 32, 32, 1.0),
              ),
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  RichText(text: TextSpan(
                      text: global.publishers[publisher].name,
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                    color:Color.fromRGBO(24, 19, 26, 0.8666666666666667),
                  ),
                  RichText(text: TextSpan(
                      text: off.time,
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),RichText(text: TextSpan(
                      text: 'Total price: '+ off.price.toString() +'\$',
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),
                  const Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                    color:Color.fromRGBO(24, 19, 26, 0.8666666666666667),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      RichText(text: TextSpan(
                          text: 'Category: '+sport.toString().toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )
                      )),
                      const SizedBox(width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(101, 97, 134, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                        ),
                        onPressed: () {
                          off.available = true;
                          bookingsLoader();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSchedule(shopId: global.publishers[publisher].id)));
                        },
                        child: const Text('MODIFY',style: TextStyle(fontSize: 10)),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(101, 97, 134, 1)),
                        ),
                        onPressed: () {
                          off.available = true;
                          bookingsLoader();
                        },
                        child: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            );
            setState(() {
              cards.add(booking);
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bookingsLoader();
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(
            53, 36, 61, 1),
            body:Padding(
                padding: const EdgeInsets.only(top: 20,right: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: "Your Bookings",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            )
                        )),
                    const SizedBox(height: 40),
                    Expanded(child: ListView(
                      children: <Widget>[
                        RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                            text: 'CURRENTLY ACTIVE',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                      )] + cards,
                    ))
                  ],
                )
            ))
    );
  }
}