import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

import 'calender_doctor/calender.dart';
import 'cancel_app.dart';
import 'homeS.dart';

List<String> docImages = [
  "images/dr2.jpg",
  "images/dr3.jpg",
  "images/dr4.jpg",
];
List favoriteDataList1 = [];

List<String> docName = [
  "DR.Hossam Ali",
  "DR.Haidy Khalil",
  "Dr.Farida Shoman"
];
bool? x;
var currentindex;
List<String> paragraph = [
  "Feb 5 2023     9:00 PM  ",
  "Aug 15 2023    11:00 AM ",
  "Aug 5 2023     8:00 PM ",
];

class upcomingtry extends StatefulWidget {
  const upcomingtry({Key? key}) : super(key: key);

  @override
  State<upcomingtry> createState() => _upcomingtryState();
}

class _upcomingtryState extends State<upcomingtry> {
  @override
  void initState() {

    setState(() {
      x = false;
    });
    super.initState();
  }

  List<Map<String, dynamic>> mylist = [];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) =>Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: kWhiteGray,
                  size: 30,
                ),
                onPressed: () {}),
            title: Text(
              "Recommended Doctors".tr,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Column(
            children: [

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: docName.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 150,
                            child: Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(docImages[index]),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(20)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(width: 1,),
                                            SizedBox(width: 145,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      favoriteDataList1
                                                          .remove(favoriteDataList1[index]);
                                                    });
                                                  } ,
                                                  child: Text('Cancel Appointment',
                                                    style: TextStyle(color: Color(0xFF008CB6),fontSize: 12),),
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
                                            SizedBox(width: 2,),
                                            SizedBox(width: 95,
                                              child: ElevatedButton(
                                                  onPressed:  () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => EventCalendarScreen1(),))
                                                  , child: Text('Reschedule',style: TextStyle(fontSize: 12),),
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
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              docName[index].tr,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff0986B2),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                          ],
                                        ),
                                        Column(children: [
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
                                              SizedBox(width: 10,),
                                              Icon(
                                                Icons.chat_rounded,
                                                color: Color(0xFF008CB6),
                                              )

                                            ],
                                          ),

                                        ],),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Container(
                                          width: 220,
                                          child: Text(
                                            paragraph[index].tr,
                                            maxLines: 3,
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Color(0xff31393C),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffF0F0F0),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )));
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

//////////////////////////////////////////////

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) =>Scaffold(
          body: favoriteDataList1.isEmpty
              ?  Center(
            child: Text(
              'There are no favorites yet!'.tr,
              style: TextStyle(color: Colors.black),
            ),
          )
              : ListView.builder(
            shrinkWrap: true,
            itemCount: favoriteDataList1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(docImages[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    favoriteDataList1[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff0986B2),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff0986B2)),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                  paragraph[index].tr,
                                  maxLines: 3,
                                  //overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff31393C),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffF0F0F0),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        )));
  }

}
