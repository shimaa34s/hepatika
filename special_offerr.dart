
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class specialOffer extends StatefulWidget {
  const specialOffer({Key? key}) : super(key: key);

  @override
  State<specialOffer> createState() => _specialOfferState();
}

class _specialOfferState extends State<specialOffer> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Special Offer'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Image.asset(
                  'images/s3.png',
                 width: 350,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'A new offer is availabile, '
                    'This offer allows you to  sessions you can have the offer by entering the code you got from the doctor. '.tr,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 1),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'Note : please,Allow notifications alerts so that you can know about our '
                    'special offers and do not miss them.'.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      primary: Color(0xFF008CB6),
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Get The Offer'.tr,
                    style: TextStyle(fontSize: 20,),
                  ))
            ],
          ),
        ),
      ),
    )));
  }
}