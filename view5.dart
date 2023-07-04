
import 'package:flutter/material.dart';

import '../cancel2.dart';
import '../upcoming_sevh.dart';
import 'cancel_lab.dart';
import 'completed_lab.dart';

class view5 extends StatefulWidget {
  const view5({Key? key}) : super(key: key);

  @override
  State<view5> createState() => _view5State();
}

class _view5State extends State<view5> {
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
          upcomingsevh(),
          completedLab(),
          cancel_lab(),

        ])
    ));
  }
}
