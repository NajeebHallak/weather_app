import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  final String ImageName;
  const ContainerImage({
    super.key,
    required this.ImageName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image(image: AssetImage(ImageName)),
    );
  }
}
