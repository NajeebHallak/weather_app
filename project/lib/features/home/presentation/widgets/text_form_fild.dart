import 'package:flutter/material.dart';
import 'package:test_tow_with_masri/core/utils/app_colors.dart';

import '../../../../core/utils/app_Text_Style.dart';

class MyTextFormFild extends StatelessWidget {
  final String whatType;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final TextEditingController? controllName;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onTap;

  const MyTextFormFild({
    super.key, 
    this.controllName,
    required this.whatType,
    required this.prefixIcon,
    this.suffixIcon,
    required this.validator,
    this.obscureText,
    this.onChanged,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controllName,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIconConstraints:const BoxConstraints(),
          labelText: whatType,
          labelStyle: AppTextStyle.Black18Normal,
          prefixIcon: Container(
              margin: const EdgeInsets.only(right: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(100),
                  color: AppColors.MaterialColor.withOpacity(0.4)
                  ),
              child: prefixIcon),
          prefixIconColor: AppColors.MaterialColor,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.MaterialColor,
        ),
        //  readOnly: true,
      ),
    );
  }
}
