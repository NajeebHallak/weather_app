import 'package:flutter/material.dart';
import 'package:test_tow_with_masri/features/home/presentation/screens/login.dart';
import 'package:test_tow_with_masri/features/home/presentation/widgets/material_button.dart';
import '../../../../core/utils/app_Text_Style.dart';
import '../widgets/circel_Image.dart';
import '../widgets/container_image.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const ContainerImage(
                ImageName: 'assets/image/hello.jpg',
              ),
              const SizedBox(
                height: 10,
              ),
              Text('HELLO', style: AppTextStyle.Black26Bold),
              const SizedBox(
                height: 15,
              ),
              MyMaterialButton(
                loginOrSign: 'LOGIN',
                style: AppTextStyle.White26Bold,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
              ),
              MyMaterialButton(
                loginOrSign: 'SIGN UP',
                style: AppTextStyle.White26Bold,
                onPressed: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Sign up using',
                style: AppTextStyle.Black16Normal,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircelImageGFI(
                    assetsName: 'assets/image/_google_icon-icons.webp',
                    radius: 20,
                  ),
                  CircelImageGFI(
                    assetsName: 'assets/image/15707884.png',
                    radius: 20,
                  ),
                  CircelImageGFI(
                    assetsName: 'assets/image/Linkedin_icon.svg.png',
                    radius: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
