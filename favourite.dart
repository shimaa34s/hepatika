import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


List<String> docImages = [
  "images/dr1.jpg",
  "images/dr2.jpg",
  "images/dr3.jpg",
  "images/dr4.jpg",
];
List favoriteDataList = [];

List<String> docName = [
  "DR.Hossam Ali",
  "DR.Ali Mohamed",
  "DR.Hana Ahmed",
  "DR.Haidy Khalil",
];
bool? x;
var currentindex;
List<String> paragraph = [
  "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ",
  "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ",
  "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ",
  "Professor and Head of Medicine in Gastroenterology  at Al-Amal hosiptal  ",
];

class FavDoc extends StatefulWidget {
  const FavDoc({Key? key}) : super(key: key);

  @override
  State<FavDoc> createState() => _FavDocState();
}

class _FavDocState extends State<FavDoc> {
  @override
  void initState() {

    setState(() {
      x = false;
    });
    super.initState();
  }

  List<Map<String, dynamic>> mylist = [];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kWhiteGray,
              size: 30,
            ),
            onPressed: () {}),
        title: Text(
          "Recommended Doctors".tr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: docName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 7,
                              ),
                              Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(docImages[index]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                       docName[index].tr,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff0986B2),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      IconButton(
                                        iconSize: 40,
                                        icon: currentindex == index
                                            ? Icon(
                                                Icons.favorite,
                                                color: kPrimaryColor,
                                              )
                                            : Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.white,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            currentindex = index;
                                            favoriteDataList
                                                .add(docName[index]);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 220,
                                    child: Text(
                                     paragraph[index].tr,
                                      maxLines: 3,
                                      //overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff31393C),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )));
  }
}

//////////////////////////////////////////////

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      body: favoriteDataList.isEmpty
          ?  Center(
              child: Text(
                'There are no favorites yet!'.tr,
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: favoriteDataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 7,
                            ),
                            Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(docImages[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      favoriteDataList[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff0986B2),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          favoriteDataList
                                              .remove(favoriteDataList[index]);
                                        });
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xff0986B2)),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 220,
                                  child: Text(
                                    paragraph[index].tr,
                                    maxLines: 3,
                                    //overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xff31393C),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF0F0F0),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
    )));
  }
}
