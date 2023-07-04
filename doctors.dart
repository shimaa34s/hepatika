import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Doctors extends StatefulWidget {
  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  List<String> specialImages = [
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/3.jpg",
  ];

  List<String> doctorName = [
    "DR.Hossam Ali".tr,
    "DR.Haidy Khalil".tr,
    "DR.Ali Mohamed".tr,
    "DR.Hana Ahmed".tr,
    "DR.Mariem Ibrahim".tr,
    "DR.Nawal Swaky".tr,
  ];

  List<String> paragraph = [
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
    "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey[400],
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
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
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: specialImages.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
              );
            },
        ),
    )));
  }
}
