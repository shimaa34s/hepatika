import 'package:firebase_task/constants.dart';
import 'const';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Payment2 extends StatefulWidget {
  const Payment2({Key? key}) : super(key: key);

  @override
  State<Payment2> createState() => _Payment2State();
}

class _Payment2State extends State<Payment2> {
  final request = BraintreePayPalRequest(amount: '50.00');
  b() async {
    BraintreePaymentMethodNonce? result = await Braintree.requestPaypalNonce(
      "sandbox_mf5drrgc_pmbgrmw3zbdzg3hq",
      request,
    );
    final reqest = BraintreeCreditCardRequest(
        cardNumber: cardNumber!.value.text,
        expirationMonth: expiryDate!.value.text,
        expirationYear: cardName!.value.text,
        cvv: cvv!.value.text);
  }

  TextEditingController? cardName;
  GlobalKey<FormState>? _key;
  TextEditingController? cardNumber;
  TextEditingController? expiryDate;
  TextEditingController? cvv;

  @override
  void initState() {
    _key = GlobalKey();
    cardName = TextEditingController();

    cardNumber = TextEditingController();

    expiryDate = TextEditingController();
    cvv = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Add New Card"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset("images/mcard.jpg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        "Card Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 57,
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: cardName,
                      onChanged: (value) {
                        setState(() {
                          cardName = value as TextEditingController?;
                        });
                      },
                      validator: (value) => value!.isEmpty
                          ? "this field is required ! ".tr
                          : null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFf2f2f2),
                          hintText: "Nawal Shawky".tr,
                          focusColor: Color(0xFFF0F0F0),
                          hintStyle: TextStyle(color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(16.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black45))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      Text(
                        "Card Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 57,
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: cardNumber,
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value as TextEditingController?;
                        });
                      },
                      validator: (value) => value!.isEmpty
                          ? "this field is required ! ".tr
                          : null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFf2f2f2),
                          hintText: "2675 1254 1200 1548".tr,
                          focusColor: Color(0xFFF0F0F0),
                          hintStyle: TextStyle(color: Colors.black26),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(16.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.black45))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          flex: 1,
                          child: Text("Expiry Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Flexible(
                            flex: 1,
                            child: Text("CVV",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 57,
                            margin: EdgeInsets.all(15),
                            child: TextFormField(
                              controller: expiryDate,
                              keyboardType: TextInputType.datetime,
                              onTap: () async {
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2016),
                                  lastDate: DateTime(2030),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    expiryDate!.text = DateFormat('yyyy-MM-dd')
                                        .format(selectedDate);
                                  }
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Date Of Birth must not be empty'.tr;
                                }
                              },
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                      color: Colors.black38,
                                      Icons.date_range_outlined),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: '29/10/2025'.tr,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 57,
                            margin: EdgeInsets.all(15),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: cvv,
                              onChanged: (value) {
                                setState(() {
                                  cvv = value as TextEditingController?;
                                });
                              },
                              validator: (value) => value!.isEmpty
                                  ? "this field is required ! ".tr
                                  : null,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFf2f2f2),
                                  hintText: "9658".tr,
                                  focusColor: Color(0xFFF0F0F0),
                                  hintStyle: TextStyle(color: Colors.black26),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black12),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.black45))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF008CB6)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        minimumSize:
                            MaterialStateProperty.all(const Size(370, 60)),
                      ),
                      onPressed: () async {
                         b();
                      },
                      child: Text("Add"))
                ],
              ),
            ),
          ),
        ));
  }
}
