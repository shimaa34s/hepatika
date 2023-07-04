import 'package:flutter/material.dart';

import '../../home.dart';

import '../calender_doctor/calender.dart';
import '../calender_doctor/cancel.dart';
import '../cancel_app.dart';
import '../calender_doctor/completed.dart';
import '../homeS.dart';

class upcoming_patient extends StatefulWidget {
  const upcoming_patient({Key? key}) : super(key: key);

  @override
  State<upcoming_patient> createState() => _upcoming_patientState();
}

class _upcoming_patientState extends State<upcoming_patient> {
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
                              child: Image.asset('images/p1.jpg',
                                  // width: 300,
                                  height: 120,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text('Nawal Shawky',style: TextStyle(fontSize: 20),),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Upcoming',
                                          style: TextStyle(
                                              color: Color(0xFF008CB6),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0xFF008CB6)),
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
                                Text('Aug 15 2023'),
                                Text('7:00 AM')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                                  height: 120,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text('Bola Samy',style: TextStyle(fontSize: 20),),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Upcoming',
                                          style: TextStyle(
                                              color: Color(0xFF008CB6),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0xFF008CB6)),
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
                                Text('8:00 AM')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                              child: Image.asset('images/p1.jpg',
                                  // width: 300,
                                  height: 120,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                Text('Manal Fathy',style: TextStyle(fontSize: 20),),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Upcoming',
                                          style: TextStyle(
                                              color: Color(0xFF008CB6),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            side: BorderSide(
                                                width: 2,
                                                color: Color(0xFF008CB6)),
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
                                Text('Aug 5 2023'),
                                Text('9:00 AM')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30,)
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
                      builder: (context) => cancel_app(),)),
                child: Text('Yes')),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    )), child: Text('No')),
          ],
        ));
  }

}
