import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  State<Lab> createState() => _LabState();
}

class _LabState extends State<Lab> {
  var user;
  getUser() {
   user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  @override
  void initState() {
    getUser();
    uploadData();
    key=GlobalKey();
    bloodTypeController = TextEditingController();
    idController = TextEditingController();
    phoneController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  TextEditingController? nameController;
  TextEditingController? idController;
  TextEditingController? phoneController;
  TextEditingController? bloodTypeController;
  GlobalKey<FormState>? key;

  CollectionReference? reference ;

  uploadData() async {

       reference= await FirebaseFirestore.instance.collection('users');
    reference?.doc(user!.email).set({
      'userName': nameController!.value.text,
      'userId': idController!.value.text,
      'userPhone': phoneController!.value.text,
      'userBloodType': bloodTypeController!.value.text,
    });
  }
  //to update data
  updateData(){
    reference?.doc('${user.id}').update({


    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: key,
          child: ListView(

            children: [
              SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      nameController!.text.trim();
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? "this field is required ! " : null,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                     hintText: "your name",
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: idController,
                  onChanged: (value) {
                    setState(() {
                      idController!.text.trim();
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? "this field is required ! " : null,
                  decoration: InputDecoration(
                      hintText: "id num",
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: bloodTypeController,
                  onChanged: (value) {
                    setState(() {
                      bloodTypeController!.text.trim();
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? "this field is required ! " : null,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "bloodType",
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  onChanged: (value) {
                    setState(() {
                      phoneController!.text.trim();
                    });
                  },
                  validator: (value) =>
                      value!.isEmpty ? "this field is required ! " : null,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFf2f2f2),
                      hintText: "Phone",
                      focusColor: Color(0xFFF0F0F0),
                      hintStyle: TextStyle(color: Colors.black26),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(7.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.black45))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: ()  {
                   uploadData();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Screen()));
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
      );
  }
}
