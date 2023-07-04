
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:table_calendar/table_calendar.dart';
import 'advirtsement.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'conatct_us.dart';
import 'payment_ui/payment_firstScreen.dart';
import 'paymentt.dart';
import 'review/review_app.dart';
import 'review/review_doc.dart';
import 'review/review_lab.dart';
import 'test_notification.dart';
import 'upload/my_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _launchURLApp() async {
    var url = Uri.parse("https://am-medicine.com/category/free-medical-books/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  BannerAd? _bannerAd;
  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _launchURLApp();
                  },
                  child: Text("link")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Paymentt()));
                  },
                  child: Text("paypal Payment")),
              ElevatedButton(
                child: Text("payment"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Payment_firstScreen()));
                },
              ),
              ElevatedButton(
                child: Text("Ad Test"),
                onPressed: () async {
                  await Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Test()));
                },
              ),
              ElevatedButton(
                child: Text("docReview"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddDoctorReview()));
                },
              ),
              ElevatedButton(
                child: Text("contact uS"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contact_Us()));
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => My_Profile()));
                  },
                  child: Text("profile")),
              ElevatedButton(
                child: Text("labReview"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddLabReview()));
                },
              ),
              ElevatedButton(
                child: Text("appReview"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAppReview()));
                },
              ),
              TableCalendar(

                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2001, 8, 10),
                lastDay: DateTime.utc(2030, 5, 5),
                headerStyle:
                    HeaderStyle(formatButtonVisible: false, titleCentered: true),
                calendarStyle:CalendarStyle() ,
              ),
              
              
              
              
              
              
              
            ],
          ),
        ),
        if (_bannerAd != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          ),
      ]),
    );
  }
}
