import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../New folder/add_med.dart';

import '../conatct_us.dart';
import '../constants.dart';
import '../home.dart';
import '../lifestyle/lifestyle_home.dart';
import '../paymentt.dart';
import '../upload/my_profile.dart';
import 'home_screen_design.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              HomePage();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  var _value;
  var user;
  TextEditingController userInput = TextEditingController();
  getUser() {
    user = FirebaseAuth.instance.currentUser;
    print(user!.email);
  }

  @override
  void initState() {
    _value = "en";
    getUser();
    super.initState();
  }

  final imagePicker = ImagePicker();
  var imageName;
  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    //picture now is in image variable
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        imageName = basename(pickedImage.path);
        //uploading image
        //to make sure that every image is unique and all images will be stored even if same images =>random method will help us
        var random = Random().nextInt(2000000);
        imageName = "$random$imageName";
        var refStorage = FirebaseStorage.instance.ref(
            'images/$imageName'); //get instance from firebase storage and store image in images folder
        refStorage.putFile(image!); //upload image
        var url = refStorage.getDownloadURL(); //get url
        print(url);
      });
    } else {}
  }

//to return images stored in firebase
  getImage() async {
    var instance = await FirebaseStorage.instance.ref("images").list();
    instance.items.forEach((element) {
      print(element.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
        builder: ((controller) => SafeArea(
              child: Scaffold(
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Align(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                            height: 15,
                          ),
                          Image.asset(
                            "images/perso.jpg",
                            width: 25,
                          ),
                          Text(
                            "Profile".tr,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 270,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            child: CircleAvatar(
                              maxRadius: 100,
                              backgroundImage:
                                  image == null ? null : FileImage(image!),
                            ),
                            onTap: () {
                              uploadImage();
                            },
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(user.email,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Edit Profile".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => My_Profile()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications_none),
                      title: Text("Notification".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text("Payment".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Paymentt()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language_outlined),
                      title: Text("Language".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _loadInterstitialAd();
                        if (_interstitialAd != null) {
                          _interstitialAd?.show();
                        }

                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight:
                                              const Radius.circular(10.0))),
                                  child: GetBuilder<AppLanguage>(
                                    init: AppLanguage(),
                                    builder: ((controller) {
                                      return ListView(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "choose language :".tr,
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 25),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ListTile(
                                              onTap: () {},
                                              leading: Text(
                                                "Arabic".tr,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              trailing: Radio(
                                                activeColor: kPrimaryColor,
                                                value: "ar",
                                                groupValue: controller.AppLang,
                                                onChanged: (String? value) {
                                                  controller
                                                      .changeLanguage(value!);
                                                  Get.updateLocale(
                                                      Locale(value));
                                                },
                                              )),
                                          ListTile(
                                              onTap: () {},
                                              leading: Text(
                                                "English".tr,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              trailing: Radio(
                                                activeColor: kPrimaryColor,
                                                value: "en",
                                                groupValue: controller.AppLang,
                                                onChanged: (String? val) {
                                                  controller
                                                      .changeLanguage(val!);
                                                  Get.updateLocale(Locale(val));
                                                },
                                              )),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              );
                            });
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyLangs()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text("Chat".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Chat_home_ui()));
                      },
                    ),
                    ListTile(
                      leading: Image.asset("images/report.jpg",
                          width: 25, height: 25),
                      title: Text("Doctor Report".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Image.asset(
                        "images/medi.jpg",
                        width: 25,
                        height: 25,
                      ),
                      title: Text("Medication".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => addMed()));
                      },
                    ),
                    ListTile(
                      leading:
                          Image.asset("images/labs.jpg", width: 25, height: 25),
                      title: Text("Labs".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _loadInterstitialAd();
                        if (_interstitialAd != null) {
                          _interstitialAd?.show();
                        }
                      },
                    ),
                    ListTile(
                      leading: Image.asset("images/appointment.jpg",
                          width: 25, height: 25),
                      title: Text("Appointment".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.phone_in_talk_rounded),
                      title: Text("Contact Us".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contact_Us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.phone_in_talk_rounded),
                      title: Text("lifeStyle".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LifeStyleHome()));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text("Logout".tr),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
