
import 'package:flutter/material.dart';

import '../cancel2.dart';
import '../cancel_com.dart';
import '../upcoming_empty.dart';
import 'cancel_lab.dart';
import 'completed_lab.dart';

class view6 extends StatefulWidget {
  const view6({Key? key}) : super(key: key);

  @override
  State<view6> createState() => _view6State();
}

class _view6State extends State<view6> {
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
          upcoming_Empty(),
          completedLab(),
          cancel_com(),

        ])
    ));
  }
}
