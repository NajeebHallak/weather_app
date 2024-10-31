import 'package:flutter/material.dart';
import 'package:test_tow_with_masri/core/utils/app_colors.dart';

class MyMaterialButton extends StatelessWidget {
  final double? minWidth;
  final Function()? onPressed;
  final String loginOrSign;
  final TextStyle style;
  const MyMaterialButton({
    super.key,
    required this.loginOrSign,
    required this.style,
    required this.onPressed,
    this.minWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.MaterialColor,
        minWidth: minWidth ?? double.infinity,
        height: 55,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          loginOrSign,
          style: style,
        ),
      ),
    );
  }
}
