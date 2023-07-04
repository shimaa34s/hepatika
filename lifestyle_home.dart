import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../my_classes/searchClass.dart';
import '../reused/reuseContainer.dart';
import '../screens/details.dart';
import '../screens/doctors.dart';
import '../screens/labs.dart';

class LifeStyleHome extends StatefulWidget {
  const LifeStyleHome({Key? key}) : super(key: key);

  @override
  State<LifeStyleHome> createState() => _LifeStyleHomeState();
}

class _LifeStyleHomeState extends State<LifeStyleHome> {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => Scaffold(

            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Life Style",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white38,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 380,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: userInput,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF0F0F0),
                        prefixIcon: IconButton(
                            onPressed: () {
                              showSearch(
                                  context: (context),
                                  delegate: CustomSearchDelegate());
                            },
                            icon: Icon(
                              Icons.search,
                              size: 30,
                            )),
                        focusColor: Color(0xFFF0F0F0),
                        hintStyle: TextStyle(color: Colors.black26),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(8.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black45))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Exercises".tr,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.white10,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Doctors()));
                          },
                          child: Text(
                            "View All".tr,
                            style:
                                TextStyle(color: Color(0xFF008CB6), fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        child: ReusedLS(
                            AssetImage("images/spo1.jpg"), "Stretching Exercise"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Details()));
                        },
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Details()));
                        },
                        child: ReusedLS(
                            AssetImage("images/spo2.jpg"), "Yoga Exercise"),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        child: ReusedLS(
                            AssetImage("images/spo1.jpg"), "Stretching Exercise"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Details()));
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Food".tr,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.white10,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Labs()));
                            },
                            child: Text(
                              "View All".tr,
                              style: TextStyle(
                                  color: Color(0xFF008CB6), fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ReusedLS(AssetImage("images/food2.jpg"), "Papaya Fruit"),
                      SizedBox(
                        width: 12,
                      ),
                      ReusedLS(AssetImage("images/orange.jpg"), "Grape Fruit"),
                      SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      ReusedLS(AssetImage("images/food2.jpg"), "Papaya Fruit"),
                      ReusedLS(AssetImage("images/orange.jpg"), "Grape Fruit"),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ]),
            ))));
  }
}
