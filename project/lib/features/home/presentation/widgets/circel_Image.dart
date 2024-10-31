import 'package:flutter/material.dart';

class CircelImageGFI extends StatelessWidget {
  final double radius;
  final String assetsName;
  const CircelImageGFI({
    required this.assetsName,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(assetsName),
      ),
    );
  }
}
