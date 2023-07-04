import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../review/review_doc.dart';
import '../screens/home_screen.dart';
import '../screens/home_screen_design.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  TextEditingController? nameController;

  TextEditingController? idController;

  TextEditingController? addressController;

  TextEditingController? gonController;

  TextEditingController? phoneController;

  TextEditingController? dateController;

  TextEditingController? yearsController;
  TextEditingController? lastName;
  TextEditingController? qualifController;
  var user;
  getUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  SingingCharacter? _character = SingingCharacter.Yes;
  GlobalKey<FormState>? key;
  String? gender;
  @override
  void initState() {
    getUser();
    uploadData();
    key = GlobalKey();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    idController = TextEditingController();
    addressController = TextEditingController();
    gonController = TextEditingController();
    dateController = TextEditingController();
    yearsController = TextEditingController();
    qualifController = TextEditingController();
    lastName = TextEditingController();
    super.initState();
  }

  CollectionReference? reference;

  uploadData() async {
    reference = await FirebaseFirestore.instance.collection('Doctors');
    reference?.doc(user!.email).set({
      'FirstName': nameController!.value.text,
      'LastName': nameController!.value.text,
      'userId': idController!.value.text,
      'userPhone': phoneController!.value.text,
      'qualification': qualifController!.value.text,
      'userAddress': addressController!.value.text,
      'gonController': gonController!.value.text,
      'dateController': dateController!.value.text,
      'yearsOfExperience': yearsController!.value.text,
      'male?':_character,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.grey[400],
                      size: 30,
                    ),
                    onPressed: () {}),
                title: Text(
                  "Fill Your Profile".tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/logo1.jpg"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'First Name'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: lastName,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Last Name'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: idController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ID must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'National Id'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Address must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Address(city,street)'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: gonController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Current Place Of Work must not be empty'
                                    .tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Governorate'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'phone must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'phone Number'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            onTap: () async {
                              await showDatePicker(

                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  dateController!.text =
                                      DateFormat('yyyy-MM-dd')
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
                                hintText: 'Date Of Birth'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: yearsController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'years of experience must not be empty'
                                    .tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Years of experience'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: qualifController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'qualification must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Qualifications'.tr,
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title:  Text('Male'.tr,style: TextStyle(fontSize: 18),),
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
                            title:  Text('female'.tr,style: TextStyle(fontSize: 18),),
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
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF028AB5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if (key!.currentState!.validate()) {
                                  uploadData();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Doc_Home_Screen()));
                                }
                              },
                              child: Text(
                                'Continue'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
