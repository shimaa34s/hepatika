
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../upload/patient_upload_data.dart';
import 'upload_file.dart';

class WHOM extends StatefulWidget {
  const WHOM({Key? key}) : super(key: key);

  @override
  State<WHOM> createState() => _WHOMState();
}

class _WHOMState extends State<WHOM> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "images/s3.png",
              width: 300,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Choose Whether you are a :".tr,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadLicense()));
              },
              child: Text(
                "Doctor".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFf2f2f2)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(370, 60)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientUpdate()));
              },
              child: Text(
                "Patient".tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFf2f2f2)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(370, 60)),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
