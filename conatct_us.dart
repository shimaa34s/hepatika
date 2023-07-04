import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_task/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';
class Contact_Us extends StatefulWidget {
  const Contact_Us({Key? key}) : super(key: key);

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  TextEditingController? fullName;
  TextEditingController? email;
  TextEditingController? phoneNumber;
  TextEditingController? message;
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
    key = GlobalKey();
    fullName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    message = TextEditingController();
    super.initState();
  }

  CollectionReference? reference;

  uploadData() async {
    reference = await FirebaseFirestore.instance.collection('Contact Us');
    reference?.doc(user!.email).set({
      'Full Name ': fullName!.value.text,
      'Email': email!.value.text,
      'Phone Number': message!.value.text,
      'Message': phoneNumber!.value.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text(
          "Contact Us",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Need help? leave your contact info and we will be in touch shortly",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: fullName,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full Name cannot be empty'.tr;
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "First Name ".tr,
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty'.tr;
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "Email".tr,
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneNumber,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number cannot be empty'.tr;
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "Phone Number".tr,
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: message,
                  keyboardType: TextInputType.text,
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Message cannot be empty'.tr;
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "Type a message".tr,
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
                SizedBox(height: 35,),
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
                    Navigator.pop(context);
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
