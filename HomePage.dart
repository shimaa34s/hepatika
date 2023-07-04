
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AddReminder.dart';
import '../constants.dart';
import 'constants.dart';
import 'globel_bloc.dart';
import 'medicine_details/medicine_details.dart';
import 'models/medicine.dart';
import 'new_entry/new_entry_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey[400],
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>AddReminder()));
              }),
          title: Text(
            "Reminder",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            TopContainer(),
            SizedBox(
              height: 2.h,
            ),
            Flexible(
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewEntryPage(),
              ));
        },
        child: Card(
          color: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.h)),
          child: Icon(
            Icons.add_outlined,
            size: 50.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobelBloc globelBloc = Provider.of<GlobelBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Worry less.\nlive healthier.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'welcome to daily Dose',
            style:TextStyle(
              fontSize: 12.sp,
              color: kTextLigthColor,
            ),
          ),
        ),
        StreamBuilder<List<Medicine>>(
            stream: globelBloc.medicineList$,
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 1.h),
                child: Text(
                  !snapshot.hasData ? '0' : snapshot.data!.length.toString(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobelBloc globelBloc = Provider.of<GlobelBloc>(context);
    return StreamBuilder(
        stream: globelBloc.medicineList$,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No Medicine',
                style: TextStyle(),
              ),
            );
          } else {
            return GridView.builder(
              padding: EdgeInsets.only(top: 1.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return MedicineCard(medicine: snapshot.data![index]);
              },
            );
          }
        });
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  Hero makeIcon(double size) {
    if (medicine.medicineType == 'Bottle') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          "assets/images/bottle.png",
          height: 12.h,
          color: kOtherColor,
        ),
      );
    } else if (medicine.medicineType == 'pill') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          "assets/images/pill.png",
          color: kOtherColor,
          height: 12.h,
        ),
      );
    } else if (medicine.medicineType == 'injection') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          "assets/images/injection.png",
          color: kOtherColor,
          height: 12.h,
        ),
      );
    } else if (medicine.medicineType == 'capsule') {
      return Hero(
        tag: medicine.medicineName! + medicine.medicineType!,
        child: Image.asset(
          "assets/images/capsule.png",
          color: kOtherColor,
          height: 12.h,
        ),
      );
    }

    return Hero(
      tag: medicine.medicineName! + medicine.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => MedicineDetails()));
        Navigator.of(context).push(PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (context, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: MedicineDetails(medicine),
                    );
                  });
            },
            transitionDuration: const Duration(milliseconds: 500)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 1.h),
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(2.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            makeIcon(7.h),
            const Spacer(),
            Hero(
              tag: medicine.medicineName!,
              child: Text(
                medicine.medicineName!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
              ),
            ),
            SizedBox(
              height: 0.3,
            ),
            Text(
              medicine.interval == 1
                  ? "Every ${medicine.interval}hour"
                  : "Every ${medicine.interval}hour",
              textAlign: TextAlign.start,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300
              ),
            ),
          ],
        ),
      ),
    );
  }
}
