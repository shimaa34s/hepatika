import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants';

class Labs extends StatefulWidget {
  const Labs({Key? key}) : super(key: key);

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  List<String> specialImages = [
    "assets/images/lab1.jpg",
    "assets/images/lab2.jpg",
    "assets/images/lab3.jpg",
    "assets/images/lab4.jpg",
    "assets/images/lab5.jpg",
  ];

  List<String> doctorName = [
    "El-Hayah lab".tr,
    "El-Shoruq lab".tr,
    "El-Shefaa lab".tr,
    "El-Sehah lab".tr,
    "El-Amal lab".tr,
  ];

  List<String> paragraph = [
    "Medical analysis lab and radiology center.".tr,
    "Medical analysis lab and radiology center.".tr,
    "Medical analysis lab and radiology center.".tr,
    "Medical analysis lab and radiology center.".tr,
    "Medical analysis lab and radiology center.".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
        title: Text(
          "Current Labs".tr,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: specialImages.length,
          itemBuilder: (context, index) {
            return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            height: 120,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(specialImages[index]),
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
                              Text(
                                doctorName[index].tr,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff0986B2),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                width: 220,
                                child: Text(
                                  paragraph[index].tr,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff31393C),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
            );
          }),
    )));
  }
}