
import 'package:flutter/material.dart';

import 'calender_doctor/cancel.dart';
import 'calender_doctor/completed.dart';
import 'calender_doctor/upcoming.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        upcoming(),
        completed_doc(),
        cancel(),

      ])
    ));
  }
}
