import 'dart:ui';

import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  final AssetImage drImage;
   var drName;
  var drExperience;
  ReuseContainer({Key? key, required this.drImage, required this.drName, required this.drExperience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(top:12),
              width: 100,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:drImage,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 4,),
          Flexible(
              flex: 1,
              child: Text("$drName",style: TextStyle(fontSize: 16),)),
          SizedBox(height: 5,),
          Flexible(
              flex: 1,
              child: Text("$drExperience",style: TextStyle(fontSize: 16),)),

        ],
      ),
    );
  }
}


class ReusedLS extends StatelessWidget {

  final AssetImage LsImage;
  var name;

  ReusedLS( this.LsImage,this.name) ;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(top:12),
              width: 100,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:LsImage,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 4,),
          Flexible(
              flex: 1,
              child: Text("$name",style: TextStyle(fontSize: 16),)),


        ],
      ),
    );
  }
}


