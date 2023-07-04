import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
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
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title:  Text('Reschedule Appointment'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SafeArea(
              child: Text(
                'Select Date'.tr,
                style: TextStyle(fontSize: 16),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2001, 8, 10),
              lastDay: DateTime.utc(2030, 5, 5),
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
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
                  child: Text('Event Title:   ${myEvents['eventTitle']}'.tr),
                ),
                subtitle: Text('Description:   ${myEvents['eventDescp']}'.tr),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(children: [
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('9:00 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //         onPressed: () {
            //           setState(() {
            //             primary:
            //             Color(0xFF008CB6);
            //           });
            //         },
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('9:30 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('10:00 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //   ]),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(children: [
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('10:30 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('11:00 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text('11:30 AM',
            //             style: TextStyle(color: Color(0xFF008CB6)))),
            //   ]),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(children: [
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text(
            //           '12:00 PM',
            //           style: TextStyle(color: Color(0xFF008CB6)),
            //         )),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //       onPressed: () {},
            //       style: OutlinedButton.styleFrom(
            //         side: BorderSide(
            //           width: 3.0,
            //           color: Color(0xFF008CB6),
            //         ),
            //         shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(20))),
            //       ),
            //       child: Text('12:30 PM',
            //           style: TextStyle(color: Color(0xFF008CB6))),
            //     ),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //           side: BorderSide(
            //             width: 3.0,
            //             color: Color(0xFF008CB6),
            //           ),
            //           shape: const RoundedRectangleBorder(
            //               borderRadius: BorderRadius.all(Radius.circular(20))),
            //         ),
            //         child: Text(
            //           '1:00 PM',
            //           style: TextStyle(color: Color(0xFF008CB6)),
            //         )),
            //   ]),
            // ),
            // Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: SizedBox(
            //         height: 40,
            //         width: 110,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //
            //           style: ElevatedButton.styleFrom(
            //
            //             backgroundColor: kPrimaryColor,
            //             shape: RoundedRectangleBorder(
            //
            //               borderRadius: BorderRadius.all(
            //
            //                 Radius.circular(20),
            //               ),
            //             ),
            //
            //           ),
            //           child: Text(
            //             'Submit',
            //             style: TextStyle(fontSize: 16),
            //           ),
            //         ),),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () => _showAddEventDialog(),
        label: Text(
          'Add Event'.tr,
          style: TextStyle(fontSize: 16),
        ),
      ),
    )));
  }
}
