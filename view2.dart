
import 'package:flutter/material.dart';

import '../cancel2.dart';
import '../upcoming4.dart';
import 'cancel.dart';
import 'completed.dart';

class view2 extends StatefulWidget {
  const view2({Key? key}) : super(key: key);

  @override
  State<view2> createState() => _view2State();
}

class _view2State extends State<view2> {
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
          upcoming4(),
          completed_doc(),
          cancel(),

        ])
    ));
  }
}
