
import 'dart:math';
import 'dart:ui';
import 'package:sports_place/management/payment.dart';

import '../special/dataStorage.dart' as global;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ShopSchedule extends StatefulWidget {
  const ShopSchedule({Key? key, required this.shopId}) : super(key: key);

  final String shopId;
  @override
  State<ShopSchedule> createState() => ShopScheduleState();
}

class ShopScheduleState extends State<ShopSchedule> {

  final showOff = <Widget>[];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);//Actual date in string

    //Creation of the widget using the object Offer
    Widget _createOffer(String id, String data, String cost, bool booked){
      String message = data+"          |          "+cost+"\$";
      var off = Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 20), bottom: Radius.elliptical(20, 20)),
          color: Color.fromRGBO(
              53, 36, 61, 1),
        ),
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.only(left: 50, right: 40, top: 5, bottom: 5),
        child: Row(
          children: [
            RichText(text: TextSpan(
                text: message,
                style: const TextStyle(
                    color: Colors.white
                )
            )),
            const Divider(
              indent: 19,
              thickness: 2,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: (() {
                  if(booked){
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(
                            14, 12, 12, 0.6313725490196078)),
                      ),
                      onPressed: () {  },
                      child: const Text('Reserved',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                    );
                  }
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(74, 69, 134, 0.8)),
                    ),
                    onPressed: () {
                      setState(() {
                        showOff.clear();
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(shopId: widget.shopId, offerId: id))); },
                    child: const Text('Book',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                  );
                }())
            )
          ],
        ),
      );
      return off;
    }

    //Function to read all offers and create a widget for each
    void _updateOffers(){
      for(var key in global.publishers[widget.shopId].offers.keys){
        var element = Padding(padding: const EdgeInsets.only(top: 10, left: 20),
        child: RichText(text: TextSpan(
            text: key.toString().toUpperCase(),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600
            ))),
        );

        setState(() {
          showOff.add(element);
        });
        for(global.Offer off in global.publishers[widget.shopId].offers[key]){
          var _tmp = _createOffer(off.id, off.time, off.price.toString(), !off.available);

          setState(() {
            showOff.add(_tmp);
          });
        }
      }
    }

    return SafeArea(
        child: Scaffold(
          body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding: const EdgeInsets.only(top: 10),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: global.publishers[widget.shopId].name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )
                    ))
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(74, 69, 134, 0.8)),
                        ),
                        onPressed: () { },
                        child: const Text('GALLERY',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                      )
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(74, 69, 134, 0.8)),
                          ),
                          onPressed: () { },
                          child: const Text('CHAT ROOM',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                        )
                    ),
                  ],
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color:Color.fromRGBO(101, 97, 134, 0.7),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text: 'Date:\t',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )
                            ))
                    ),
                    Padding(padding: const EdgeInsets.only(left: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(101, 97, 134, 0.7),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: DateFormat('dd/MM/yyyy').format(now),
                          isCollapsed: true,
                        ),
                      ),
                    )
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text: 'Time:\t',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )
                            ))
                    ),
                    Padding(padding: const EdgeInsets.only(left: 40, top: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: const TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(101, 97, 134, 0.7),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(),
                              hintText: '1 hour',
                              isCollapsed: true,
                            ),
                          ),
                        )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(74, 69, 134, 0.8)),
                          ),
                          onPressed: () {
                            if(showOff.isNotEmpty) showOff.clear();
                            _updateOffers();
                          },
                          child: const Text('LET\'S SEE',style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12)),
                        )
                    ),
                  ],
                ),
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  thickness: 2,
                  color:Color.fromRGBO(101, 97, 134, 0.7),
                ),
                Expanded(child: ListView(
                  children: <Widget>[
                    RichText(text: const TextSpan(
                        text: 'This place has the following sports places and availability:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        )),
                      textAlign: TextAlign.center,
                    ),
                  ] + showOff,
                ))
              ],
            ),
        )
    );
  }
}