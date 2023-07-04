
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_secondScreen.dart';


class Payment_firstScreen extends StatefulWidget {
  const Payment_firstScreen({Key? key}) : super(key: key);

  @override
  State<Payment_firstScreen> createState() => _Payment_firstScreenState();
}

class _Payment_firstScreenState extends State<Payment_firstScreen> {
  var groupValue ;
  @override
  void initState() {
   groupValue=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) => Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Payments".tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Select the payment method you want to use.".tr,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Card(
              child: ListTile(

                  leading: Image.asset(
                    "images/pay.jpg",
                    width: 50,

                  ),
                  title: Text("Paypal".tr),
                  trailing: Radio(
                    activeColor: kPrimaryColor,
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    },
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Card(
              color: Colors.white,
              child: ListTile(
                  leading: Image.asset(
                    "images/google.png",

                    width: 30,
                  ),
                  title: Text("Google Pay".tr),
                  trailing: Radio(
                    activeColor: kPrimaryColor,
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    },
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            Card(
                child: ListTile(
                    leading: Image.asset(
                      "images/apple.png",
                     width: 30,
                    ),
                    title: Text("Apple Pay".tr),
                    trailing: Radio(
                      activeColor: kPrimaryColor,
                      value: 3,
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue=value;
                        });
                      },
                    ))),
            SizedBox(
              height: 12,
            ),
            Card(
              child: ListTile(
                selectedTileColor: kPrimaryColor,
                  leading: Image.asset(
                    "images/master.jpg",
                    height: 30,
                  ),
                  title: Text(".... .... .... 7285"),
                  trailing: Radio(
                    activeColor: kPrimaryColor,
                    value: 4,
                    groupValue: groupValue,
                    onChanged: (val) {
                      setState(() {
                        groupValue = val;
                      });
                    },
                  )),
            ),

            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment2()));
              },
              child: Text("Next".tr),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF008CB6)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(370, 60)),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
