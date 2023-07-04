
import 'package:flutter/material.dart';

import '../cancel2.dart';
import '../upcoming_empty.dart';
import 'completed.dart';

class view1 extends StatefulWidget {
  const view1({Key? key}) : super(key: key);

  @override
  State<view1> createState() => _view1State();
}

class _view1State extends State<view1> {
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
          completed_doc(),
          cancel2(),

        ])
    ));
  }
}
