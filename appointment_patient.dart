
import 'package:firebase_task/New%20folder/calender_patient/upcoming_patien.dart';
import 'package:flutter/material.dart';

import '../calender_lab/cancel_lab.dart';
import 'cancel_patient.dart';
import '../calender_lab/completed_lab.dart';
import 'completed_patient.dart';

class app_patient extends StatefulWidget {
  const app_patient({Key? key}) : super(key: key);

  @override
  State<app_patient> createState() => _app_patientState();
}

class _app_patientState extends State<app_patient> {
  String value='';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
        appBar: AppBar(backgroundColor:Colors.white,
          title:const Text('My Appointment',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          //centerTitle:true,
          //  leading: Icon(Icons.account_box),
          bottom: TabBar(tabs: [
            Tab(child:Text( 'Upcoming',style: TextStyle(fontSize: 16,color: Colors.black),)),
            Tab(child:Text( 'Complete',style: TextStyle(fontSize: 16,color: Colors.black),)),
            Tab(child:Text( 'Cancel',style: TextStyle(fontSize: 16,color: Colors.black),)),
            //  Tab(text: 'profile',icon:Icon( Icons.account_box),),

          ]),

        ),
        body: TabBarView(children: [
          upcoming_patient(),
          completedpatient(),
          cancel_patient(),

        ])
    ));
  }
}
