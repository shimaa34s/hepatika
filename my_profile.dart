import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../screens/home_screen_design.dart';

class My_Profile extends StatefulWidget {
  const My_Profile({Key? key}) : super(key: key);

  @override
  State<My_Profile> createState() => _My_ProfileState();
}

class _My_ProfileState extends State<My_Profile> {

  var user;
  getUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }
  //final stateQuery = citiesRef.where("state", isEqualTo: "CA");
  // CollectionReference? docRef;
  // Firestore.instance .collection('users').document('xsajAansjdna') .get() .then((value) => print("Fetched ==>>>"+value.data["username"]));

  var lname;
  var id;
  var date;
  var gon;
  var suffer;
  var address;
  var blood;
  var phone;
  var name;
  queryData() async {
    final docRef = await FirebaseFirestore.instance
        .collection("Patients")
        .doc("${user!.email}");

    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        setState(() {
          name = data["FirstName"];
          lname = data["LastName"];
          id = data["NationalId"];
          date = data["dateController"];
          gon = data["gonController"];
          suffer = data["sufferController"];
          address = data["userAddress"];
          blood = data["userBloodType"];
          phone=data["userPhone"];

          print(name);
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }


  @override
  void initState() {
    getUser();
    queryData();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:lname==null?CircularProgressIndicator(): SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage:
                  image == null ? null : FileImage(image!),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text(
                    "First Name : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$name",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Last Name : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),  Text(
                    "$lname",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "National Id : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$id",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Address : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$address",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Government : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$gon",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Phone Number : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$phone",
                    style: TextStyle(fontSize:17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Email : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),

                  ),
                  Text(
                   user.email,
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Birth Date : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$date",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Blood Type : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "$blood",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Sex : ",
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text(
                    "Female",
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
