import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../upload/doctor_upload_data.dart';

class UploadLicense extends StatefulWidget {
  const UploadLicense({Key? key}) : super(key: key);

  @override
  State<UploadLicense> createState() => _UploadLicenseState();
}

class _UploadLicenseState extends State<UploadLicense> {
  final imagePicker = ImagePicker();
  var imageName;
  File? image;
  uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    //picture now is in image variable
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        imageName = basename(pickedImage.path);
        //uploading image
        //to make sure that every image is unique and all images will be stored even if same images =>random method will help us
        var random = Random().nextInt(2000000);
        imageName = "$random$imageName";
        var refStorage = FirebaseStorage.instance.ref(
            'images/$imageName'); //get instance from firebase storage and store image in images folder
        refStorage.putFile(image!); //upload image
        var url = refStorage.getDownloadURL(); //get url
        print(url);
      });
    } else {}
  }

//to return images stored in firebase
  getImage() async {
    var instance = await FirebaseStorage.instance.ref("images").list();
    instance.items.forEach((element) {
      print(element.name);
    });
  }

  //final double gap;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLanguage>(
        init: AppLanguage(),
    builder: ((controller) =>Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008CB6),
        title: Text(
          'Confirm that you are a doctor'.tr,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Upload  Your Medical License'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){uploadImage();}, icon: Icon(Icons.upload_sharp,size: 50,)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [6, 10],
                  color: Color(0xFF008CB6),
                  strokeWidth: 2,
                  child: image == null
                      ? Container(
                          width: 400,
                          height: 450,
                        )
                      : Image.file(image!),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Note: please make sure that your medical license is as clear as possible.'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorProfile(),
                    ),
                  );
                },
                child: Text(
                  "continue".tr,
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
            ],
          ),

      ),
    )));
  }
}
