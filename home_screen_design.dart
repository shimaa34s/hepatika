import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../my_classes/searchClass.dart';
import '../reused/reuseContainer.dart';
import 'details.dart';
import 'doctors.dart';
import 'favourite.dart';
import 'labs.dart';

File? image;
class Home_Screen_Design extends StatefulWidget {
  const Home_Screen_Design({Key? key}) : super(key: key);
  @override
  State<Home_Screen_Design> createState() => _Home_Screen_DesignState();
}
class _Home_Screen_DesignState extends State<Home_Screen_Design> {
  var name;
  var lname;
  queryData() async {
    final docRef = await FirebaseFirestore.instance
        .collection("Patients")
        .doc("${user!.email}");
    docRef.get().then(
          (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          name = data["FirstName"];
          lname = data["LastName"];});},
      onError: (e) => print("Error getting document: $e"),);}
  @override
  void initState() {
    getUser();
    queryData();
    super.initState();}
  TextEditingController userInput = TextEditingController();
  var user;
  getUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user!.email);}
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>SingleChildScrollView(
      child:name==null? CircularProgressIndicator(): Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage:
                            image == null ? null : FileImage(image!),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text("Good Morning".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFFA1A1A1))),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${name + " " +lname}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FavDoc()));
                  },
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 35,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 390,
              height: 50,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: userInput,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF0F0F0),
                    prefixIcon: IconButton(
                        onPressed: () {
                          showSearch(
                              context: (context),
                              delegate: CustomSearchDelegate());
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        )),
                    focusColor: Color(0xFFF0F0F0),
                    hintStyle: TextStyle(color: Colors.black26),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.black45))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            "40%",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF008CB6)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Greet offers on lab tests and sessions by code".tr,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF008CB6))),
                        ],
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(top: 9, bottom: 9),
                        width: 140,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/lab1.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(24)),
                      ))
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF38008CB6),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Doctors".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.white10,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Doctors()));
                      },
                      child: Text(
                        "View All".tr,
                        style:
                            TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    child: ReuseContainer(
                        drImage: AssetImage("images/dr1.jpg"),
                        drName: "Dr.Mostafa Ali".tr,
                        drExperience: "3-year experience".tr),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));

                    },
                    child: ReuseContainer(
                        drImage: AssetImage("images/dr3.jpg"),
                        drName: "Dr.Hana Ahmed".tr,
                        drExperience: "2-year experience".tr),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  ReuseContainer(
                      drImage: AssetImage("images/dr2.jpg"),
                      drName: "Dr.Hossam Ahmed".tr,
                      drExperience: "2-year experience".tr),
                  SizedBox(
                    width: 12,
                  ),
                  ReuseContainer(
                      drImage: AssetImage("images/dr4.jpg"),
                      drName: "Dr.muhammad Omar".tr,
                      drExperience: "4-year experience".tr),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Labs".tr,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.white10,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Labs()));
                        },
                        child: Text(
                          "View All".tr,
                          style:
                              TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ReuseContainer(
                      drImage: AssetImage("images/lab1.jpg"),
                      drName: "Al-Hayah Lab".tr,
                      drExperience: "Medical Analysis Lab".tr),
                  SizedBox(
                    width: 12,
                  ),
                  ReuseContainer(
                      drImage: AssetImage("images/lab2.jpg"),
                      drName: "El-Shorouk Lab".tr,
                      drExperience: "Medical Analysis Lab".tr),
                  SizedBox(
                    width: 12,
                  ),
                  ReuseContainer(
                      drImage: AssetImage("images/lab3.jpg"),
                      drName: "Al-Mostakbal Lab".tr,
                      drExperience: "Medical Analysis Lab".tr),
                  SizedBox(
                    width: 12,
                  ),
                  ReuseContainer(
                      drImage: AssetImage("images/lab4.jpg"),
                      drName: "HLL Lab".tr,
                      drExperience: "Medical Analysis Lab".tr),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
