import 'package:flutter/material.dart';

class sport extends StatefulWidget {
  const sport({Key? key}) : super(key: key);
  @override
  State<sport> createState() => _sportState();
}

class _sportState extends State<sport> {
  List<String> str = [
    " Walking",
    "To benefit from walking as an exercise, it is necessary to travel a distance continuously for a period of not less than 30 to 90",
    "Strength and Tensile"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recomended Exercises",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  'Walking ',
                  style: TextStyle(fontSize: 20),
                ), //text
              ),
            ]),
            SizedBox(
              width: 370,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('images/walk.jpeg',
                    // width: 300,
                    height: 250,
                    fit: BoxFit.fill),
              ),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 5,
              ),
              //space between bullet and text
              Text(
                "To benefit from walking as an exercise, it is",
                style: TextStyle(fontSize: 18),
              ),
              //text
            ]),
            Text(
              ' necessary to travel a distance continuously',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'for a period of not less than 30 to 90',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'minutes per day. That is, 2.5 hours',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' a week, which is sufficient to',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'lose the desired weight.',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 5,
              ),
              //space between bullet and text
              Text(
                'You must practice walking at a certain speed',
                style: TextStyle(fontSize: 18),
              ),
              //text
            ]),
            Text(
              'which stimulates the increase in heart rate',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'and breathing rate per minute, and you',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              ' may make sure of this by monitoring',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'the use of an application or device',
              style: TextStyle(fontSize: 18),
            ),
            Text('to monitor that',
              style: TextStyle(fontSize: 18),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 5,
              ),
              //space between bullet and text
              Text(
                'Strength and Tensile',
                style: TextStyle(fontSize: 18),
              ),
              //text
            ]),
            SizedBox(
              width: 370,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('images/exc.jpeg',
                    // width: 300,
                    height: 250,
                    fit: BoxFit.fill),
              ),
            ),
            Row(children: [
              Text(
                "\u2022",
                style: TextStyle(fontSize: 50, color: Color(0xFF008CB6)),
              ), //bullet text
              SizedBox(
                width: 5,
              ),
              //space between bullet and text
              Text(
                'Strength and stretching exercises are one',
                style: TextStyle(fontSize: 18),
              ),
              //text
            ]),

               Text( 'of the most important exercises performed by',                style: TextStyle(fontSize: 18),
            )
              ,Text(  ' sports practitioners, as their benefit is',                style: TextStyle(fontSize: 18),
            )
              ,Text('based on a significant increase in muscle',                style: TextStyle(fontSize: 18),
            )
              ,Text('strength, and therefore, they are',                style: TextStyle(fontSize: 18),
            )
              ,Text('beneficial for liver patients, as they',                style: TextStyle(fontSize: 18),
            )
             ,Text(' suffer from sarcopenia, which is nothing',                style: TextStyle(fontSize: 18),
            )
             ,Text(' but the gradual loss of muscle mass',                style: TextStyle(fontSize: 18),
            )
              ,Text('and the skeleton, in addition to a ',                style: TextStyle(fontSize: 18),
            )
              ,Text('decrease in The remaining muscular ',                style: TextStyle(fontSize: 18),
            )
              ,Text('strength, and thus aerobic exercises',                style: TextStyle(fontSize: 18),
            )
              ,Text('based on strength and tension,',                style: TextStyle(fontSize: 18),
            )
              ,Text('contribute to an increase in skeletal',                style: TextStyle(fontSize: 18),
            )
              ,Text('muscle mass, in addition to improving',                style: TextStyle(fontSize: 18),
            )
              ,Text('the effect of insulin resistance and',                style: TextStyle(fontSize: 18),
            )
              ,Text('regulating metabolism.',                style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
