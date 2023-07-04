import 'package:flutter/material.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foods To Avoid',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  ' Alcohol ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'Alcohol is a major cause of fatty liver disease ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' as well as other liver diseases . One need to',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'srictly avoid consuming alcohol drinks.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  ' Sugar ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'Stae away from sugary foods such as candy,',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'cookies , sodas and fruit juices. High blood',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' sugar increase the amount of fat buildup in',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'the liver.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  ' Fried foods ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'As name suggests , these are high in fat and',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'calories . Eating these in daily routine not',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' only harms your liver but also your heart.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  ' Salt ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'Eating too much salt can make your body hold',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' on to excess water. Limit sodium to less than',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '1,500 milligrams per day.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  ' Red Meat ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'Beef and deli meats are high in saturated fat.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 10,
              ),
              //space between bullet and text
              Expanded(
                child: Text(
                  '     Refined foods ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            Text(
              'Refined flour is bleached and processed to make',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' it whiter. it can raise your blood sugar more',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'than whole grains due to a lack of fiber',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'and puts more stress on liver',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
