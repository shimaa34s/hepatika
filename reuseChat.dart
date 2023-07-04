import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatReuse extends StatelessWidget {
ChatReuse(this.message);
final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 12,top: 16,bottom: 16,right: 12),
        margin: EdgeInsets.all(10),
        child: Text(message.message),
        decoration: BoxDecoration(
          color: kWhiteGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
class ChatReuse2 extends StatelessWidget {
  const ChatReuse2({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 12,top: 16,bottom: 16,right: 12),
        margin: EdgeInsets.all(10),
        child: Text(message.message,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
    color: Color(0xFF008CB6),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),


              ),
      ),
    ));
  }
}

