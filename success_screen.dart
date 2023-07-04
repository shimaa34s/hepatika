import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SuccessSreen extends StatefulWidget {
  const SuccessSreen({Key? key}) : super(key: key);

  @override
  State<SuccessSreen> createState() => _SuccessSreenState();
}

class _SuccessSreenState extends State<SuccessSreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "images/ok.jpg",
        ),
      ),
    );
  }
}
