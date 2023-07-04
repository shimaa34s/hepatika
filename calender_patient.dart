import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../../controller/app_language.dart';
import '../../constants.dart';
import '../calender_lab/appointment_lab.dart';
import 'appointment_patient.dart';

class EventCalendarScreen3 extends StatefulWidget {
  const EventCalendarScreen3({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen3> createState() => _EventCalendarScreen3State();
}

class _EventCalendarScreen3State extends State<EventCalendarScreen3> {
  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _flag5 = true;
  bool _flag6 = true;
  bool _flag7 = true;
  bool _flag8 = true;
  bool _flag9 = true;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;

    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2022-09-13": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-30": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2022-09-20": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                setState(() {
                  if (mySelectedEvents[
                  DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                    DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                      }
                    ];
                  }
                });

                print(
                    "New Event for backend developer ${json.encode(mySelectedEvents)}");
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Text('Reschedule Appointment'.tr),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Text(
                    'Select Date'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2001, 8, 10),
                lastDay: DateTime.utc(2030, 5, 5),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDate, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
                eventLoader: _listOfDayEvents,
              ),
              ..._listOfDayEvents(_selectedDate!).map(
                    (myEvents) => ListTile(
                  leading: const Icon(
                    Icons.done,
                    color: Colors.teal,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                    Text('Event Title:   ${myEvents['eventTitle']}'.tr),
                  ),
                  subtitle:
                  Text('Description:   ${myEvents['eventDescp']}'.tr),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select Hour',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag1 = !_flag1),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag1
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '07:00 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag2 = !_flag2),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag2
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '07:30 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag3 = !_flag3),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag3
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '08:00 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag4 = !_flag4),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag4
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '08:30 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag5 = !_flag5),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag5
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '09:00 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag6 = !_flag6),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag6
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '09:30 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag7 = !_flag7),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag7
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '10:00 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag8 = !_flag8),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag8
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '10:30 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => setState(() => _flag9 = !_flag9),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _flag9
                                  ? Colors.white70
                                  : Color(0xFF008CB6),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF008CB6),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  )) // This is what you need!
                          ),
                          child: Text(
                            '11:00 AM',
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 40,
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
                                          "images/ok.jpg",
                                          height: 200,
                                          width: 200,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Text(
                                                "Rescheduling sucess!".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Color(
                                                        0xFF008CB6)))),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "  Appointment sucessfully Changed you"
                                                .tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                            "will recieve a notifecation and the"
                                                .tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                            "doctor will contact you."
                                                .tr,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              onPressed:  () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => app_patient(),)),
                                              child: Text(
                                                "View Appointment".tr,
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
                                                    const Size(200, 30)),
                                              ),
                                            ),
                                            // SizedBox(height: 5,),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Cancel".tr,
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
                                                    const Size(200, 30)),
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                      ]),
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _flag1
                              ? Color(0xFF008CB6)
                              : Color(0xFF008CB6),
                          side: BorderSide(
                            width: 3,
                            color: Color(0xFF008CB6),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              )) // This is what you need!
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),

          //    floatingActionButton: FloatingActionButton.extended(
          //     backgroundColor: kPrimaryColor,
          //   onPressed: () => _showAddEventDialog(),
          // label: Text(
          //       'Add Event'.tr,
          //     style: TextStyle(fontSize: 16),
          // ),
          //     ),
        )));
  }
}
