import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_tow_with_masri/core/utils/app_Text_Style.dart';
import 'package:test_tow_with_masri/core/utils/app_colors.dart';

import 'package:test_tow_with_masri/features/home/presentation/screens/login.dart';
import 'package:test_tow_with_masri/features/home/presentation/widgets/app_bar.dart';

import '../widgets/circel_Image.dart';
import '../widgets/name_email.dart';
import '../widgets/the_row_in_profile.dart';

class Profile extends StatefulWidget {
  final DateTime? dateTime;
  final String name;
  final String number;

  const Profile({
    super.key,
    required this.dateTime,
    required this.name,
    required this.number,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: non_constant_identifier_names
  DateTime? MydateTime = dateTime;
  File? image = null;

  @override
  Widget build(BuildContext context) {
    // File? image=null;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          Title: 'PROFILE',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          image != null
                              ? CircleAvatar(
                                  radius: 45,
                                  child: ClipOval(
                                    child: Image.file(
                                      width: 80,
                                      height: 80,
                                      image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : const CircelImageGFI(
                                  assetsName: 'assets/image/profile.jpg',
                                  radius: 40,
                                ),
                          Stack(
                            children: [
                              Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: AppColors.MaterialColor,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                left: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BottumSheetImage(),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const NsameAndEmail(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TheRowInProfile(
                    onTap: () {
                      selectDate();
                    },
                    type: 'birth',
                    whatType: MydateTime.toString().split(' ')[0],
                  ),
                  TheRowInProfile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => BottumSheet(),
                      );
                    },
                    type: 'Edit',
                    whatType: 'Setting',
                  ),
                  TheRowInProfile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    type: 'Log out',
                    whatType: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          MydateTime = value;
        });
      }
    });
  }

  Future pickImage(ImageSource source) async {
    final returnedImage = await ImagePicker().pickImage(source: source);

    setState(() {
      image = File(returnedImage!.path);
    });

    if (image == null) {
      return;
    }
  }

  // ignore: non_constant_identifier_names
  Widget BottumSheetImage() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Shoose brofile image',
            style: AppTextStyle.Black18Bold,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: AppColors.MaterialColor,
                      )),
                  Text(
                    'Camera',
                    style: AppTextStyle.Black16Normal,
                  ),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.image,
                        size: 25,
                        color: AppColors.MaterialColor,
                      )),
                  Text(
                    'gallery',
                    style: AppTextStyle.Black16Normal,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottumSheet() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Shoose brofile image',
            style: AppTextStyle.Black18Bold,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: AppColors.MaterialColor,
                      )),
                  Text(
                    'Camera',
                    style: AppTextStyle.Black16Normal,
                  ),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      icon: Icon(
                        Icons.image,
                        size: 25,
                        color: AppColors.MaterialColor,
                      )),
                  Text(
                    'gallery',
                    style: AppTextStyle.Black16Normal,
                  ),
                ],
              ),
              const SizedBox(
                width: 35,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        selectDate();
                      },
                      icon: Icon(
                        Icons.date_range_outlined,
                        size: 25,
                        color: AppColors.MaterialColor,
                      )),
                  Text(
                    'Date Birth',
                    style: AppTextStyle.Black16Normal,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
