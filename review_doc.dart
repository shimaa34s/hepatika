import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../constants.dart';

enum SingingCharacter { Yes, No }

class AddDoctorReview extends StatefulWidget {
  const AddDoctorReview({Key? key}) : super(key: key);

  @override
  State<AddDoctorReview> createState() => _addreviewState();
}

class _addreviewState extends State<AddDoctorReview> {
  SingingCharacter? _character = SingingCharacter.Yes;
  TextEditingController? doctorReview;
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
    key=GlobalKey();
    isRecommended=true;
   doctorReview= TextEditingController();
    rating1= _character;
    super.initState();
  }
  CollectionReference? reference ;
  uploadData() async {
    reference= await FirebaseFirestore.instance.collection('Doctor_Review');
    reference?.doc(user!.email).set({
      'review about doctor:':doctorReview!.value.text,
      'rating':rating1,
      'is Recommended':isRecommended,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>
      Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/dr1.jpg',
                  ),
                  radius: 75,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  SizedBox(width: 6,),
                  Text(
                    'How was your experience with Dr. Mostafa\n ali?'.tr,
                    style: TextStyle(
                        color: Color(0xFF008CB6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
                    rating1=rating;
                  });
                  print(rating);
                },
              ),
              SizedBox(
                height: 30,
              ),
              //first thing texttttttttttttttttttttttttttttttttttttttt
              Text(
                'Write your review'.tr,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: Color(0xFF008CB6),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 120,
                  width: 360,
                  child: TextFormField(
                    controller:doctorReview,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'was dealing convenient must not be empty'.tr;
                      }
                    },
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kWhiteGray,
                      labelText: 'write your review here',
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 8),
                child: Text(
                  'Would recommend Dr. Mostafa ali to  your friends?'.tr,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF008CB6),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title:  Text('Yes'.tr,style: TextStyle(fontSize: 18),),
                leading: Radio<SingingCharacter>(
                  activeColor: kPrimaryColor,
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
                title:  Text('No'.tr,style: TextStyle(fontSize: 18),),
                leading: Radio<SingingCharacter>(
                  activeColor: kPrimaryColor,
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
                    minimumSize: Size(350, 50),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      child: Text("review successfully",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF008CB6)))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Your review has been",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("successfully submitted",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("thank you very much",
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
                                      "Ok",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Color(0xFF008CB6)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(28),
                                        ),
                                      ),
                                      minimumSize: MaterialStateProperty.all(
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
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
