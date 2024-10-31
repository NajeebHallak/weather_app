import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../../../../core/utils/app_Text_Style.dart';

class TheRowInProfile extends StatelessWidget {

  final String type;
  final String whatType;
  final VoidCallback? onTap;
  const TheRowInProfile({
    super.key,

    required this.type,
    required this.whatType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: AppTextStyle.ColorMaerial18Bold,
                ),
                Text(
                  whatType,
                  style: AppTextStyle.Black26Normal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
