import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


enum SingingCharacter { Yes, No }

class AddLabReview extends StatefulWidget {
  const AddLabReview({Key? key}) : super(key: key);

  @override
  State<AddLabReview> createState() => _AddLabReviewState();
}

class _AddLabReviewState extends State<AddLabReview> {
  SingingCharacter? _character = SingingCharacter.Yes;
  TextEditingController? labReview;
  var rating1;
  var isRecommended;

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
    key = GlobalKey();
    isRecommended = true;
    labReview = TextEditingController();
    rating1 = 0;
    super.initState();
  }

  CollectionReference? reference;
  uploadData() async {
    reference = await FirebaseFirestore.instance.collection('Lab_Review');
    reference?.doc(user!.email).set({
      'review about doctor:': labReview!.value.text,
      'rating': rating1,
      'is Recommended': isRecommended,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Text(
                  'Add your review'.tr,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/lab1.jpg',
                          ),
                          radius: 75,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 12),
                          Text(
                            'How was your experience with El_Shefaa\n Lab?'.tr,
                            style:
                                TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
                            rating1 = rating;
                          });
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Write your review'.tr,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Color(0xFF008CB6),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 140,
                          width: 360,
                          child: TextFormField(
                            controller: labReview,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'lab review must not be empty'.tr;
                              }
                            },
                            maxLines: 6,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: kWhiteGray,
                              labelText: 'write your review here'.tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 12),
                          Text(
                            'Would recommend El Shafaa Lab to  your\n friends?'
                                .tr,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF008CB6),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ListTile(
                        selectedColor: kPrimaryColor,
                        title: Text(
                          'Yes'.tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.Yes,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        selectedColor: kPrimaryColor,
                        title: Text(
                          'No'.tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.No,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                                        borderRadius: BorderRadius.circular(35)),
                                    child: Container(
                                      color: Colors.white,
                                      height: 430,
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
                                                        color:
                                                            Color(0xFF008CB6)))),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("Your review has been".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold)),
                                            Text("successfully submitted".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold)),
                                            Text("thank you very much".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold)),
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
                                                shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(28),
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
                            'Submit'.tr,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )));
  }
}
