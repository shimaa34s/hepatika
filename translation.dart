import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_task/utils/Arabic.dart';
import 'package:firebase_task/utils/English.dart';

class Translation extends Translations{
  @override
  // TODO: implement keys
  //keys(refers to what are languages in your app.
  Map<String, Map<String, String>> get keys => {
   "en":en,
    "ar":ar,
  };
}