import 'package:flutter/material.dart';
class Current_Doctors extends StatefulWidget {
  const Current_Doctors({Key? key}) : super(key: key);

  @override
  State<Current_Doctors> createState() => _Current_DoctorsState();
}

class _Current_DoctorsState extends State<Current_Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Doctors"),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/lab1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Dr.Mostafa Ali",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        child: Divider(
                          color: Colors.black26,
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                          "Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    )
                  ],
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/lab1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Dr.Mostafa Ali",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        child: Divider(
                          color: Colors.black26,
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                          "Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    )
                  ],
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/lab3.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Dr.Mostafa Ali",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        child: Divider(
                          color: Colors.black26,
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                          "Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    )
                  ],
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 7,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 200,
                  height: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/dr1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("Dr.Mostafa Ali",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        child: Divider(
                          color: Colors.black26,
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                          "Professor and Head of Gastroenterology Department at Al-AMAL specialised Hospital ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    )
                  ],
                ),
              )
            ],
          ),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
        ),

      ],),
    );
  }
}
