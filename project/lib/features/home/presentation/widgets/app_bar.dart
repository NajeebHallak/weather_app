import 'package:flutter/material.dart';
import 'package:test_tow_with_masri/core/utils/app_Text_Style.dart';
import 'package:test_tow_with_masri/core/utils/app_colors.dart';

class MyAppBar extends AppBar {
  final String Title;
  MyAppBar({super.key, required this.Title})
      : super(
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          backgroundColor: AppColors.MaterialColor,
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          title: Text(
            Title,
            style: AppTextStyle.White26Bold,
          ),
        );
}
