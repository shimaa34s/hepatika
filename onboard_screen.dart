import 'package:flutter/material.dart';
import 'package:get/get.dart';



class OnBoarding_screen extends StatefulWidget {
  const OnBoarding_screen({Key? key}) : super(key: key);

  @override
  State<OnBoarding_screen> createState() => _OnBoarding_screenState();
}

class _OnBoarding_screenState extends State<OnBoarding_screen> {
  int currentpage = 0;
  PageController _controller = new PageController();
  List<Widget> pages = [
    page4(),
    page1(),
    page2(),
    page3(),
  ];
  @override
  void initState() {
    _controller;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: PageView.builder(
      //           // scrollDirection: Axis.horizontal,
      //           controller: _controller,
      //           itemCount: pages.length,
      //           itemBuilder: (context, int index) {
      //             return pages[index];
      //           },
      //           onPageChanged: (int index) {
      //             setState(
      //               () {
      //                 currentpage = index;
      //               },
      //             );
      //           },
      //       ),
      //     ),
      //     Container(
      //         child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: List.generate(
      //               pages.length,
      //               (index) {
      //                 return AnimatedContainer(
      //                   duration: Duration(milliseconds: 300),
      //                   height: 8,
      //                   width: (index == currentpage) ? 40 : 10,
      //                   margin: EdgeInsets.only(right: 8),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(25),
      //                     color: index == currentpage
      //                         ? kPrimaryColor
      //                         : Colors.black26,
      //                   ),
      //                 );
      //               },
      //             ))),
      //     SizedBox(
      //       height: 40,
      //       width: 20,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         _controller.nextPage(
      //             duration: Duration(milliseconds: 100),
      //             curve: Curves.bounceIn);
      //         if (currentpage == pages.length - 1) {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (context) => SignUp()));
      //         }
      //       },
      //       child: currentpage == pages.length - 1
      //           ? Text(
      //               "Get Started",
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //             )
      //           : Text(
      //               "Next",
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //             ),
      //       style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(Color(0xFF008CB6)),
      //         shape: MaterialStateProperty.all(
      //           RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(28),
      //           ),
      //         ),
      //         minimumSize: MaterialStateProperty.all(const Size(370, 60)),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 30,
      //     )
      //   ],
      // ),
      bottomSheet: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  // scrollDirection: Axis.horizontal,
                  controller: _controller,
                  itemCount: pages.length,
                  itemBuilder: (context, int index) {
                    return pages[index];
                  },
                  onPageChanged: (int index) {
                    setState(
                      () {
                        currentpage = index;
                      },
                    );
                  },
              ),
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 8,
                          width: (index == currentpage) ? 40 : 10,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: index == currentpage
                                ? kPrimaryColor
                                : Colors.black26,
                          ),
                        );
                      },
                    ))),
            SizedBox(
              height: 40,
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
                if (currentpage == pages.length - 1) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignUp()));
                }
              },
              child: currentpage == pages.length - 1
                  ? Text(
                      "Get Started".tr,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  : Text(
                      "Next".tr,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF008CB6)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(370, 60)),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ) ,
    )));
  }
}

Widget page1() =>GetBuilder<AppLanguage>(
  init: AppLanguage(),
  builder: ((controller) => Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "images/111.png",
            height: 550,
          ),
          Text(
            """
Thousands of """.tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            """
doctors & experts to """.tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            """help your health!""".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    )));

Widget page2() => GetBuilder<AppLanguage>(
  init: AppLanguage(),
  builder: ((controller) =>Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "images/222.png",
            height: 550,
          ),
          Text(
            "Health Checks".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "and consultation".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "anywhere anytime".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    )));

Widget page3() =>GetBuilder<AppLanguage>(
  init: AppLanguage(),
  builder: ((controller) => Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
),
          Image.asset(
            "images/33.png",
            height: 550,
          ),
          Text(
            "Lets start living".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "healthy and well ".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "with us right now".tr,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    )));

Widget page4() =>GetBuilder<AppLanguage>(
init: AppLanguage(),
builder: ((controller) => Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Wrap(children: [
          Column(
            children: [
              Image.asset(
                'images/44.jpg',
                width: double.infinity,
                height: 500,
              ),
              SizedBox(
                height: 5,
                width: 5,
              ),
              Text(
                'Welcome to'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF008CB6)),
              ),
              Text(
                'Hepatica!'.tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF008CB6)),
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A medical application for healthy liver \n'
                        'to help both the doctor and the patient'.tr,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    )));
