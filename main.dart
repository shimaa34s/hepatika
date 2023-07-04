import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'MEDICINE/globel_bloc.dart';
import 'firebase_options.dart';
import 'helper.dart';
import 'onboarding_screen/onboard_screen.dart';

import 'screens/home_screen.dart';
import 'translation.dart';

List<String> testDeviceIds = ['ECA4A563D160B24A842B939A0A5CE756'];
bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await GooglePay.initializeGooglePayment();
  MobileAds.instance.initialize();
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  // thing to add
  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  MobileAds.instance.updateRequestConfiguration(configuration);
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobelBloc? globalBloc;
  AppoiGlobelBloc? appoiGlobelBloc;
  @override
  void initState() {
    globalBloc = GlobelBloc();
    appoiGlobelBloc = AppoiGlobelBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Helper.helper.createNoteDb();
    return Provider<AppoiGlobelBloc>.value(
      value: appoiGlobelBloc!,
      child: Provider<GlobelBloc>.value(
        value: globalBloc!,
        child: Sizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: islogin == false ? OnBoarding_screen() : Home_Screen(),
            debugShowCheckedModeBanner: false,
            translations: Translation(),
            //local(refers to default language in our app)
            locale: Locale("en"),
            //if there is an eng file not found it will  use english.
            fallbackLocale: Locale("en"),
          );
        }),
      ),
    );
  }
}
