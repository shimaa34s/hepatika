import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class Diagnosis extends StatefulWidget {
  const Diagnosis({Key? key}) : super(key: key);

  @override
  State<Diagnosis> createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFD9EDF4),
              width: double.infinity,
              height: 280,
              padding: const EdgeInsetsDirectional.only(top: 40, start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                    const AssetImage("assets/images/patient3.jpg"),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Hi, Nawal'.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text('We are here for your'.tr,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                          color: Colors.black)),
                  RichText(
                    text:  TextSpan(children: [
                      TextSpan(
                          text: 'medicine'.tr,
                          style: TextStyle(
                            color: Color(0xff128FB7),
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          )),
                       TextSpan(
                          text: ' daily reminder'.tr,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: Colors.black)),
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 15,
              ),
              child: TextField(
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'search medications'.tr,
                  hintStyle: TextStyle(color: Color(0xffC9C9C9)),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon:
                   Icon(Icons.search, color: Color(0xffC9C9C9)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Color(0xffC9C9C9), width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                    borderSide:
                    const BorderSide(color: const Color(0xffC9C9C9)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Text(
                    'Daily dose'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 30),
                  child: Text(
                    'Today'.tr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10, end: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 3, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                            ),
                            child: Image(
                                image: AssetImage("assets/images/pill1.png"))),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Omega Plus'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'omega 3,once daily after meal'.tr,
                              style: TextStyle(color: Color(0xffC9C9C9)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '9:00 AM'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 3, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                            ),
                            child: Image(
                                image: AssetImage("assets/images/pill1.png"))),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vatamin D3'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'cholecalcalferol,twice daily '.tr,
                              style: TextStyle(color: Color(0xffC9C9C9)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '11:00 AM'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 3, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                            ),
                            child: Image(
                                image: AssetImage("assets/images/pill1.png"))),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gynera'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Gestodene 0.75mg,once daily '.tr,
                              style: TextStyle(color: Color(0xffC9C9C9)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '2:00 PM'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 3, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                            ),
                            child: Image(
                                image: AssetImage("assets/images/pill1.png"))),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zyrtec'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'cetrzin 30mg,1 pill before sleep'.tr,
                              style: TextStyle(color: Color(0xffC9C9C9)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '11:00 PM'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                        start: 5, end: 3, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD3D3D3), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                            ),
                            child: Image(
                                image: AssetImage("assets/images/pill1.png"))),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vitamin E'.tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'cholecalcalferol,twice daily'.tr,
                              style: TextStyle(color: Color(0xffC9C9C9)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '11:00 AM'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}