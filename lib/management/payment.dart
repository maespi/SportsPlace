

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_place/special/dataStorage.dart' as global;

class Payment extends StatefulWidget {
  const Payment({Key? key, required this.shopId, required this.offerId}) : super(key: key);

  final String offerId;
  final String shopId;
  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment> {


  @override
  Widget build(BuildContext context) {

    var offer;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);//Actual date in string


    for(var _tmp in global.publishers[widget.shopId].offers.keys){
      for(var _tmpOff in global.publishers[widget.shopId].offers[_tmp]){
        if(_tmpOff.id == widget.offerId) offer = _tmpOff;
      }
    }

    return SafeArea(
        child: Scaffold(
        body:Padding(padding: const EdgeInsets.only(top: 20,right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "PAYMENT",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    )
                )),
            const SizedBox(height: 40),
            RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: global.publishers[widget.shopId].name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    )
                )),
            const Divider(
              thickness: 2,
              color:Color.fromRGBO(101, 97, 134, 0.7),
            ),
            RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                    text: "Summary of your order:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )
                )),
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 20), bottom: Radius.elliptical(20, 20)),
                color: Color.fromRGBO(
                    103, 99, 142, 1.0),
              ),
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  RichText(text: TextSpan(
                      text: global.publishers[widget.shopId].name,
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),RichText(text: TextSpan(
                      text: formattedDate,
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),RichText(text: TextSpan(
                      text: offer.time,
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
                      text: 'Total: '+offer.price.toString()+'\$',
                      style: const TextStyle(
                          color: Colors.white
                      )
                  )),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color:Color.fromRGBO(101, 97, 134, 0.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(101, 97, 134, 1)),
                  ),
                  onPressed: () {

                    for(var _tmp in global.publishers[widget.shopId].offers.keys){
                      for(var _tmpOff in global.publishers[widget.shopId].offers[_tmp]){
                        if(_tmpOff.id == widget.offerId) _tmpOff.available = false;
                      }
                    }
                    showCupertinoDialog<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        content:
                        Text('Your payment details and confirmation has been sent to '+ global.mainUser.Email),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            child: const Text('Close'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/welcome', (_) => false);
                            },
                          )
                        ],
                      ),
                    );

                    //Navigator.pop(context);
                  },
                  child: const Text('CONFIRM',style: TextStyle(fontSize: 10)),
                )
              ],
            )

          ],
        )
        ))
    );
  }
}