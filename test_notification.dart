import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_task/screens/profile.dart';
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  var serverToken="AAAARhAMKes:APA91bEtO6pXg0uV8n2PFoQUTdDf7FAIo7YQQrUQ_pJZlbi0Cq00RtKcUARlFFuKErqGggCAIt0bvLHcls3mCie5Vidke_JQQofMdbyEPtrIOCkfctsHGQST63p_1qSBolU0WW5ZQ778 ";

  var fbm = FirebaseMessaging.instance;
  //this method works when app is terminated

  initialmessage()async{
   var message= FirebaseMessaging.instance.getInitialMessage();
   if(message!=null){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
   }
  }
  @override
  void initState() {
     initialmessage();
    fbm.getToken().then((value) {
      //firstly i get token of target app.
      String? token = value;
      print('the token is : $token');
    });
      //this method is used when notification is opened(it works in background)
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>const Profile()));
    });
   // i get notification data and print it in terminal.
    FirebaseMessaging.onMessage.listen((event) {
      print("Notification data");
      print('${event.notification?.body}');
      // AwesomeDialog(
      //   context: context,
      //   title: "hello",
      //   body: Text("${event.notification?.body}"),
      // );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:

    Column(children: [
      ElevatedButton(onPressed: () async {
      await  FirebaseMessaging.instance.subscribeToTopic("weather");
      }, child: const Text("subscribe to topic")),
      ElevatedButton(onPressed: () async {
        await  FirebaseMessaging.instance.unsubscribeFromTopic("weather");
      }, child: const Text("unSubscribe to topic")),
    ],)


      ,);
  }
}
