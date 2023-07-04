
import 'package:flutter/material.dart';

import '../cancel_com.dart';
import 'cancel_lab.dart';
import 'completed_lab.dart';
import 'upcoming_lab.dart';

class app_lab extends StatefulWidget {
  const app_lab({Key? key}) : super(key: key);

  @override
  State<app_lab> createState() => _app_labState();
}

class _app_labState extends State<app_lab> {
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
          upcoming_lab(),
          completedLab(),
          cancel_lab(),

        ])
    ));
  }
}
