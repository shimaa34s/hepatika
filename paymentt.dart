import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'constants.dart';

class Paymentt extends StatefulWidget {
  const Paymentt({Key? key}) : super(key: key);

  @override
  State<Paymentt> createState() => _PaymenttState();
}

class _PaymenttState extends State<Paymentt> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  //
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse("http:www.paypal.com"),
      )..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: kPrimaryColor,),
      body: SafeArea(
        child: Center(
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
