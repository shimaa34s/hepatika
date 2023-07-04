import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class AddAppReview extends StatefulWidget {
  const AddAppReview({Key? key}) : super(key: key);

  @override
  State<AddAppReview> createState() => _AddAppReviewState();
}

class _AddAppReviewState extends State<AddAppReview> {
  TextEditingController?  wasAppEasy;
  TextEditingController? wasDealingConvinenet ;
  TextEditingController?facedAnyProblem;
  TextEditingController?  anySuggestions;
  var rating1;

  var user;
  getUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  GlobalKey<FormState>? key;
  String? gender;
  @override
  void initState() {
    getUser();
    uploadData();
    key=GlobalKey();
    wasAppEasy=TextEditingController();
    wasDealingConvinenet= TextEditingController();
    facedAnyProblem= TextEditingController();
    anySuggestions= TextEditingController();
    rating1=0;
    super.initState();
  }



  CollectionReference? reference ;

  uploadData() async {

    reference= await FirebaseFirestore.instance.collection('App_Review');
    reference?.doc(user!.email).set({
      'wasAppEasy ?':wasAppEasy!.value.text,
      'wasDealingConvenient ?':wasDealingConvinenet!.value.text,
      'anySuggestions ?':anySuggestions!.value.text,
      'facedAnyProblem ?':facedAnyProblem!.value.text,
      'rating':rating1,
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Text('Rate the app'.tr),
              ),
              backgroundColor: Color(0xFFECF9FF),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Was the app easy for you?'.tr,
                              style: TextStyle(
                                  color: Color(0xFF008CB6), fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //textfielddddddddddddddddddddddddddddddddddddddd
                        TextFormField(
                          controller: wasAppEasy,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Was App Easy must not be empty'.tr;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 20),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Was dealing through the application convenient for you?'
                              .tr,
                          style:
                              TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //textfielddddddddddddddddddddddddddddddddddddddd
                        TextFormField(
                          controller:wasDealingConvinenet,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'was dealing convenient must not be empty'.tr;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Have you faced any problem?'.tr,
                              style: TextStyle(
                                  color: Color(0xFF008CB6), fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //textfielddddddddddddddddddddddddddddddddddddddd
                        TextFormField(
                          controller:facedAnyProblem,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'was dealing convenient must not be empty'.tr;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Do you have any suggestions for making the app better?'
                              .tr,
                          style:
                              TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //textfielddddddddddddddddddddddddddddddddddddddd
                        TextFormField(
                          controller:anySuggestions,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'any suggestions must not be empty'.tr;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                            labelText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFF008CB6),
                          ),
                          onRatingUpdate: (rating) {
                           setState(() {
                             rating1=rating;
                           });
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 3,
                                primary: Color(0xFF008CB6),
                                minimumSize: Size(350, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                )),
                            onPressed: () {
                              uploadData();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Container(
                                        color: Colors.white,
                                        height: 450,
                                        width: 300,
                                        margin: EdgeInsets.all(20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "images/ss.png",
                                                height: 200,
                                                width: 200,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                  child: Text(
                                                      "review successfully".tr,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFF008CB6)))),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text("Your review has been".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("successfully submitted".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("thank you very much".tr,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Ok".tr,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Color(0xFF008CB6)),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28),
                                                    ),
                                                  ),
                                                  minimumSize:
                                                      MaterialStateProperty.all(
                                                          const Size(200, 60)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                            ]),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'Rate'.tr,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

}
