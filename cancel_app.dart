import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cancel_app extends StatefulWidget {
  const cancel_app({Key? key}) : super(key: key);

  @override
  State<cancel_app> createState() => _cancel_appState();
}

class _cancel_appState extends State<cancel_app> {
  String _selectedValue = 'Others';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cancel Appointment',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 30,
              width: 350,
              child: Text(
                'Reason for Schedule Change',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          RadioListTile<String>(
              value: 'I want to change to another doctor',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I want to change to another doctor')),
          RadioListTile<String>(
              value: 'I want to change package',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I want to change package')),
          RadioListTile<String>(
              value: 'I don’t want to consult',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I don’t want to consult')),
          RadioListTile<String>(
              value: 'I have recovered from the disease',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I have recovered from the disease')),
          RadioListTile<String>(
              value: 'I want to change to another doctor',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I want to change to another doctor')),
          RadioListTile<String>(
              value: 'I have found a suitable medicine',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text(
                'I have found a suitable medicine',
                style: TextStyle(fontSize: 16),
              )),
          RadioListTile<String>(
              value: 'I just want to cancel',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('I just want to cancel')),
          RadioListTile<String>(
              value: 'Others',
              groupValue: _selectedValue,
              onChanged: (value) => onRadiosSelected(value),
              title: Text('Others')),

          SizedBox(
            height: 150,
          ),
          SizedBox(
            width: 350,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(35)),
                          child: Container(
                            color: Colors.white,
                            height: 400,
                            width: 300,
                            margin: EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/ss.png",
                                    height: 200,
                                    width: 200,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: Text(
                                          "review successfully".tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.bold,
                                              color: Color(
                                                  0xFF008CB6)))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("We are very sad that you have canceled".tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                          FontWeight.bold)),
                                  Text("your appointment we will always".tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                          FontWeight.bold)),
                                  Text("improve our service to satisfy".tr,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                          FontWeight.bold)),
                          Text("you in the next appointment".tr,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Ok".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Color(0xFF008CB6)),
                                      shape:
                                      MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                        ),
                                      ),
                                      minimumSize:
                                      MaterialStateProperty.all(
                                          const Size(300, 50)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                ]),
                          ),
                        );
                      });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF008CB6),
                    side: BorderSide(width: 2, color: Color(0xFF008CB6)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      15,
                    )))),
          )
        ],
      ),
    );
  }

  onRadiosSelected(String? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

}
