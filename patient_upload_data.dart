import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

import '../screens/home_screen.dart';
import '../screens/home_screen_design.dart';
getImage() async {
  var instance = await FirebaseStorage.instance.ref("images").list();
  instance.items.forEach((element) {
    print(element.name);
  });
}
class PatientUpdate extends StatefulWidget {
  @override
  State<PatientUpdate> createState() => _PatientUpdateState();
}

class _PatientUpdateState extends State<PatientUpdate> {
  final imagePicker = ImagePicker();
  var imageName;
  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    //picture now is in image variable
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        imageName = basename(pickedImage.path);
        //uploading image
        //to make sure that every image is unique and all images will be stored even if same images =>random method will help us
        var random = Random().nextInt(2000000);
        imageName = "$random$imageName";
        var refStorage = FirebaseStorage.instance.ref(
            'images/$imageName'); //get instance from firebase storage and store image in images folder
        refStorage.putFile(image!); //upload image
        var url = refStorage.getDownloadURL(); //get url
        print(url);
      });
    } else {}
  }

//to return images stored in firebase

  TextEditingController? nameController;

  TextEditingController? idController;

  TextEditingController? addressController;

  TextEditingController? gonController;

  TextEditingController? phoneController;

  TextEditingController? dateController;

  TextEditingController? bloodController;
  TextEditingController? lastName;
  TextEditingController? sufferController;
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
    phoneController = TextEditingController();
    nameController = TextEditingController();
    idController = TextEditingController();
    addressController = TextEditingController();
    gonController = TextEditingController();
    dateController = TextEditingController();
    bloodController = TextEditingController();
    sufferController = TextEditingController();
    lastName = TextEditingController();
    super.initState();
  }

  CollectionReference? reference;

  uploadData() async {
    reference = await FirebaseFirestore.instance.collection('Patients');
    reference?.doc(user!.email).set({
      'FirstName': nameController!.value.text,
      'LastName': lastName!.value.text,
      'NationalId': idController!.value.text,
      'userPhone': phoneController!.value.text,
      'userBloodType': bloodController!.value.text,
      'userAddress': addressController!.value.text,
      'gonController': gonController!.value.text,
      'dateController': dateController!.value.text,
      'sufferController': sufferController!.value.text,

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
                          InkWell(
                            child: CircleAvatar(
                              maxRadius: 100,
                              backgroundImage:
                              image == null ?null : FileImage(image!),
                            ),
                            onTap: () {
                              uploadImage();
                            },
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
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  dateController!.text =
                                      DateFormat('yyyy-MM-dd'.tr)
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
                            controller: bloodController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ' Graduation year must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Blood Type'.tr,
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
                            controller: sufferController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'allergies must not be empty'.tr;
                              }
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Do you suffer any allergies'.tr,
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
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[200],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    "Male".tr,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  value: "male",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[200],
                                ),
                                child: RadioListTile(
                                  title: Text(
                                    "Female".tr,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  value: "female",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
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
                              onPressed: () async {
                                if (key!.currentState!.validate()) {
                                  uploadData();
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home_Screen()));
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
