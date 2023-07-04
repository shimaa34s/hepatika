import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sizer/sizer.dart';

import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../home.dart';
import '../commen/convert_time.dart';
import '../constants.dart';
import '../globel_bloc.dart';
import '../models/error.dart';
import '../models/medicine.dart';
import '../models/medicine_type.dart';
import '../succes_screen/success_screen.dart';
import 'new_entry_bloc.dart';


class NewEntryPage extends StatefulWidget {
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController doseController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldkey;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    doseController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    doseController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newEntryBloc = NewEntryBloc();
    _scaffoldkey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    intializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobelBloc globelBloc = Provider.of<GlobelBloc>(context);
    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomInset: false,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }),
          title: Text(
            "Add Your Medicine",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PanelTitle(
                title: 'Medicine Name',
                isRequired: true,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: nameController,
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: 'Enter medicine name',
                  hintStyle: const TextStyle(color: Color(0xffC9C9C9)),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Color(0xffF3F3F3), width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(7)),
                    borderSide:
                        const BorderSide(color: const Color(0xffF3F3F3)),
                  ),
                ),
                style: TextStyle(color: kOtherColor),
              ),
              const PanelTitle(
                title: 'Dosage in mg',
                isRequired: false,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                maxLength: 12,
                controller: doseController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Dosage',
                  hintStyle: const TextStyle(color: Color(0xffC9C9C9)),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide(color: Color(0xffF3F3F3), width: 1),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kTextColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(7)),
                    borderSide:
                        const BorderSide(color: const Color(0xffF3F3F3)),
                  ),
                ),
                style: TextStyle(color: kOtherColor),
              ),
              SizedBox(
                height: 2.h,
              ),
              const PanelTitle(
                title: 'Medicine Type',
                isRequired: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: StreamBuilder<MedicineType>(
                  stream: _newEntryBloc!.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MedicineTypeColumn(
                          medicineType: MedicineType.bottle,
                          name: "bottle",
                          iconValue: "assets/images/bottle.png",
                          isSelected: snapshot.data == MedicineType.bottle
                              ? true
                              : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.pill,
                          name: "pill",
                          iconValue: "assets/images/pill.png",
                          isSelected:
                              snapshot.data == MedicineType.pill ? true : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.injection,
                          name: "injection",
                          iconValue: "assets/images/injection.png",
                          isSelected: snapshot.data == MedicineType.injection
                              ? true
                              : false,
                        ),
                        MedicineTypeColumn(
                          medicineType: MedicineType.capsule,
                          name: "capsule",
                          iconValue: "assets/images/capsule.png",
                          isSelected: snapshot.data == MedicineType.capsule
                              ? true
                              : false,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const PanelTitle(
                title: 'Interval Selection',
                isRequired: true,
              ),
              const IntervelSelection(),
              const PanelTitle(
                title: 'Starting Time',
                isRequired: true,
              ),
              const SelectTime(),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 8.w,
                ),
                child: SizedBox(
                  width: 100.h,
                  height: 7.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Center(
                      child: Text(
                        "Add Medicine",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      String? medicineName;
                      int? dosage;
                      if (nameController.text == "") {
                        _newEntryBloc.submitError(EntryError.nameNull);
                        return;
                      }
                      if (nameController.text != "") {
                        medicineName = nameController.text;
                      }
                      if (doseController.text == "") {
                        dosage = 0;
                        return;
                      }
                      if (doseController.text != "") {
                        dosage = int.parse(doseController.text);
                      }
                      for (var medicine in globelBloc.medicineList$!.value) {
                        if (medicineName == medicine.medicineName) {
                          _newEntryBloc.submitError(EntryError.nameDuplicate);
                          return;
                        }
                      }
                      if (_newEntryBloc.selectedIntevals!.value == 0) {
                        _newEntryBloc.submitError(EntryError.interval);
                        return;
                      }
                      if (_newEntryBloc.selectedTimeOfDay!.value == 'None') {
                        _newEntryBloc.submitError(EntryError.startTime);
                        return;
                      }
                      String medicineType = _newEntryBloc
                          .selectedMedicineType!.value
                          .toString()
                          .substring(13);

                      int interval = _newEntryBloc.selectedIntevals!.value;
                      String startTime = _newEntryBloc.selectedTimeOfDay!.value;

                      List<int> intIDS =
                          makeIDS(24 / _newEntryBloc.selectedIntevals!.value);
                      List<String> notificationIDS =
                          intIDS.map((i) => i.toString()).toList();
                      Medicine newEntryMedicine = Medicine(
                        notificationIDs: notificationIDS,
                        medicineName: medicineName,
                        dosage: dosage,
                        medicineType: medicineType,
                        interval: interval,
                        startTime: startTime,
                      );
                      globelBloc.updateMedicineList(newEntryMedicine);
                      scheduleNotification(newEntryMedicine);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessSreen()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void intializeErrorListen() {
    _newEntryBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("please enter the medicine's name");
          break;
        case EntryError.nameDuplicate:
          displayError(" medicine name already exists");
          break;
        case EntryError.dosage:
          displayError("please enter the dosage required");
          break;
        case EntryError.interval:
          displayError("please select the reminder's interval");
          break;
        case EntryError.startTime:
          displayError("please select the reminder's starting time ");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      duration: const Duration(milliseconds: 2000),
    ));
  }

  List<int> makeIDS(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettingIos = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingAndroid, iOS: initializationSettingIos);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload:$payload');
    }
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'repeatDailyAtTime channel id', 'repeatDailyAtTime channel name',
        importance: Importance.max,
        ledColor: kOtherColor,
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true);
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var PlatformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      if (hour + (medicine.interval! * i) > 23) {
        hour = hour + (medicine.interval! * i) - 24;
      } else {
        hour = hour + (medicine.interval! * i);
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(
          int.parse(medicine.notificationIDs![i]),
          'Reminder:${medicine.medicineName}',
          medicine.medicineType.toString() != MedicineType.none.toString()
              ? 'It is time your ${medicine.medicineType!.toLowerCase()},according to schedule'
              : 'It is time your medicine ,according to schedule',
          Time(hour, minute, 0),
          PlatformChannelSpecifics);
      hour = ogValue;
    }
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;
  Future<TimeOfDay> _selectTime() async {
    final NewEntryBloc newEntryBloc=Provider.of<NewEntryBloc>(context,listen: false);
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        newEntryBloc.updateTime(convertTime(_time.hour.toString()) + convertTime(_time.minute.toString()));
      });
    }
    return picked!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor, shape: const StadiumBorder()),
          onPressed: () {
            _selectTime();
          },
          child: Center(
            child: Text(
              _clicked == false
                  ? "Select Time"
                  : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IntervelSelection extends StatefulWidget {
  const IntervelSelection({Key? key}) : super(key: key);

  @override
  State<IntervelSelection> createState() => _IntervelSelectionState();
}

class _IntervelSelectionState extends State<IntervelSelection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remind me entry',
            style: TextStyle(
              fontSize: 12.sp,
              color: kTextColor,
            ),
          ),
          DropdownButton(
            iconEnabledColor: kOtherColor,
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'Select an Intreval',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map(
              (int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                );
              },
            ).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal as int;
                newEntryBloc.updateInterval(newVal);
              });
            },
          ),
          Text(
            _selected == 1 ? "hours" : "hours",
            style: TextStyle(
              fontSize: 12.sp,
              color: kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {Key? key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected})
      : super(key: key);
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        newEntryBloc.updateSelectedMedicine(medicineType);
      },
      child: Column(
        children: [
          Container(
              width: 20.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                color: isSelected ? kOtherColor : Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                  child: Image.asset(
                    iconValue,
                    color: isSelected ? Colors.white : kOtherColor,
                  ),
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 20.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isSelected ? kOtherColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                name,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isSelected ? Colors.white : kOtherColor,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({Key? key, required this.title, required this.isRequired})
      : super(key: key);
  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(TextSpan(children: <TextSpan>[
        TextSpan(
          text: title,
          style: TextStyle(
              fontSize: 10.sp, fontWeight: FontWeight.w500, color: kTextColor),
        ),
        TextSpan(
          text: isRequired ? "*" : "",
          style: TextStyle(color: kPrimaryColor),
        ),
      ])),
    );
  }
}
