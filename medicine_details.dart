
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../../home.dart';
import '../constants.dart';
import '../globel_bloc.dart';
import '../models/medicine.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobelBloc _globelBloc = Provider.of<GlobelBloc>(context);
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
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          title: Text(
            "Details",
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
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
            Spacer(),
            SizedBox(
              width: 100.w,
              height: 7.h,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder()),
                  onPressed: () {
                    openAlertBox(context, _globelBloc);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: kScaffoldColor,
                    ),
                  )),
            ),
            SizedBox(
              height: 2.h,
            )
          ],
        ),
      ),
    );
  }

  openAlertBox(BuildContext context, GlobelBloc _globelBloc) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kScaffoldColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            contentPadding: EdgeInsets.only(top: 1.h),
            title: Text(
              "Delete this Reminder",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: kPrimaryColor,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextLigthColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _globelBloc.removedMedicine(widget.medicine);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: kSeconderyColor,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;
  Hero makeIcon(double size) {
    if (medicine!.medicineType == 'Bottle') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Image.asset(
          "assets/images/bottle.png",
          height: 7.h,
          color: kOtherColor,
        ),
      );
    } else if (medicine!.medicineType == 'pill') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Image.asset(
          "assets/images/pill.png",
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == 'injection') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Image.asset(
          "assets/images/injection.png",
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == 'capsule') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: Image.asset(
          "assets/images/capsule.png",
          color: kOtherColor,
          height: 7.h,
        ),
      );
    }

    return Hero(
      tag: medicine!.medicineName! + medicine!.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        makeIcon(7.h),
        SizedBox(
          width: 2.w,
        ),
        Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTap(
                  fieldTitle: 'Medicine Name',
                  fieldInfo: medicine!.medicineName!,
                ),
              ),
            ),
            MainInfoTap(
              fieldTitle: 'Dosage',
              fieldInfo: medicine!.dosage == 0
                  ? 'NotSpecified'
                  : "${medicine!.dosage}mg",
            ),
          ],
        ),
      ],
    );
  }
}

class MainInfoTap extends StatelessWidget {
  const MainInfoTap(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: kTextLigthColor,
              ),
            ),
            SizedBox(
              height: 0.6.h,
            ),
            Text(
              fieldInfo,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: kTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key, this.medicine}) : super(key: key);
  final Medicine? medicine;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTap(
          fieldTitle: 'Medicine Type',
          fieldInfo: medicine!.medicineType! == 'None'
              ? 'Not Specified'
              : medicine!.medicineType!,
        ),
        ExtendedInfoTap(
          fieldTitle: 'Dose Interval',
          fieldInfo:
              'Every ${medicine!.interval} hours | ${medicine!.interval == 24 ? "One time a day" : "${(24 / medicine!.interval!).floor()}"} times a day',
        ),
        ExtendedInfoTap(
          fieldTitle: 'Start Time',
          fieldInfo:
              '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}',
        ),
      ],
    );
  }
}

class ExtendedInfoTap extends StatelessWidget {
  const ExtendedInfoTap(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);

  final String fieldTitle;

  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: TextStyle(
                fontSize: 12.sp,
                color: kTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            fieldInfo,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
