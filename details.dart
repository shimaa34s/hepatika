import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  actions: [
                    Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                  title: Text(
                    "Dr.Mostafa Ali".tr,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
                body: Stack(
                    children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: 200,
                                height: 130,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("images/dr1.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text("Dr.Mostafa Ali".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(left: 6, right: 6),
                                        child: Divider(
                                          color: Colors.black26,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 6, right: 6),
                                      child: Text(
                                          "Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital "
                                              .tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "About me".tr,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Dr.Mostafa Ali is a Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital ."
                                    "He has won many awards . Graduated with honors at the faulty of medicine"
                                .tr,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Working Time".tr,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Monday-Friday at 8AM-20PM".tr,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reviewers".tr,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "View All".tr,
                                        style: TextStyle(
                                            color: Color(0xFF008CB6),
                                            fontSize: 22),
                                      )),
                                )
                              ])),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 210),
                                child:
                                    Image.asset("images/p1.jpg", width: 180)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "Dr:mostafa is very professional in his work my problems were solved thanks to him."
                                        "He is trusted doctor."
                                    .tr,
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 18, right: 18),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Book Appointment".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF008CB6)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            minimumSize:
                                MaterialStateProperty.all(const Size(300, 50)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
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
                ],
                ),
              ),
            )));
  }
}
