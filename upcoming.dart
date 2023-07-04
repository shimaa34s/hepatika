
import 'package:flutter/material.dart';

import '../../home.dart';
import '../cancel2.dart';
import '../event_cand.dart';
import 'view1.dart';
import 'view2.dart';
import 'view3.dart';
import 'calender.dart';
import 'cancel.dart';
import '../cancel_app.dart';
import 'completed.dart';

class upcoming extends StatefulWidget {
  const upcoming({Key? key}) : super(key: key);

  @override
  State<upcoming> createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: InkWell(
                onTap: () => print("ciao"),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              child: Image.asset('images/dr2.jpg',
                                  // width: 300,
                                  height: 130,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text('Dr.Hossam Ali',style: TextStyle(fontSize: 20),),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Upcoming',
                                          style: TextStyle(
                                              color: Colors.greenAccent,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                                width: 2,
                                                color: Colors.greenAccent),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  15,
                                                )))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.chat_rounded,
                                      color: Color(0xFF008CB6),
                                    )
                                  ],
                                ),
                                Text('Feb 5 2023'),
                                Text('7:00 AM')
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            SizedBox(width: 180,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => view1(),));
                                  _showDialog2();

                                },
                                  child: Text('Cancel Appointment',style: TextStyle(color: Color(0xFF008CB6)),),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      side: BorderSide(
                                          width: 3,
                                          color: Color(0xFF008CB6)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                            20,
                                          )))),
                            ),
                            SizedBox(width: 20,),
                            SizedBox(width: 150,
                              child: ElevatedButton(
                                  onPressed:  () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventCalend(),))
                                  , child: Text('Reschedule'),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF008CB6),
                                      side: BorderSide(
                                          width: 3,
                                          color: Color(0xFF008CB6)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                            20,
                                          )))),
                            ),

                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
  _showDialog2() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Cancel Appointment',style: TextStyle(color: Colors.red),),
          content: Text('Are you sure you want to cancel your appointment?'),
          actions: [
            TextButton(
                onPressed:  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => view1(),)),
                child: Text('Yes')),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => view2(),
                    )), child: Text('No')),
          ],
        ));
  }

}
