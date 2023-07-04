import 'package:flutter/material.dart';

//import 'APPOINTMENT/HomeScreen.dart';
import 'MEDICINE/HomePage.dart';


class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  bool color1 = false;
  bool color2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[400],
              size: 30,
            ),
            onPressed: () {}),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Choose whether you want to ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "add reminder for: ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 20, bottom: 5),
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 5, end: 5, top: 5, bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: color1 ? Color(0xFF028AB5) : Color(0xffD3D3D3),
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      var router = new MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen());
                      Navigator.of(context).push(router);
                      setState(() {
                        color1 = !color1;
                      });
                    },
                    child: Text(
                      'Appointment',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 20, end: 20, top: 20, bottom: 5),
                child: Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 5, end: 5, top: 5, bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: color2 ? Color(0xFF028AB5) : Color(0xffD3D3D3),
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                         var router = new MaterialPageRoute(
                             builder: (BuildContext context) => HomePage());
                        Navigator.of(context).push(router);
                      setState(() {
                        color2 = !color2;
                      });
                    },
                    child: Text(
                      'Medicine',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
