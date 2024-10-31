
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_Text_Style.dart';
import '../screens/login.dart';

class NsameAndEmail extends StatelessWidget {
  const NsameAndEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTextStyle.Black26Bold),
          const SizedBox(height: 5),
          Text(email, style: AppTextStyle.Black18Bold),
        ],
      ),
    );
  }
}
