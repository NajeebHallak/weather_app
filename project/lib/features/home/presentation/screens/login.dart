import 'package:flutter/material.dart';
import 'package:test_tow_with_masri/core/utils/app_Text_Style.dart';
import 'package:test_tow_with_masri/features/home/presentation/screens/profile.dart';
import '../widgets/container_image.dart';
import '../widgets/material_button.dart';
import '../widgets/text_form_fild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var controllName = TextEditingController();
String name = '';
String email = '';
DateTime? dateTime = DateTime.now();

var controllDate = TextEditingController();
// ignore: non_constant_identifier_names
GlobalKey<FormState> Formkey = GlobalKey<FormState>();
bool isobscureText = true;

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Form(
                key: Formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const ContainerImage(
                      ImageName: 'assets/image/login.jpg',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'LOGIN',
                      style: AppTextStyle.Black26Bold,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyTextFormFild(
                      whatType: 'Full Name',
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(
                        Icons.manage_accounts_rounded,
                        
                      ),
                      validator: (value) {
                        if ((value.toString()).isEmpty) {
                          return 'It does not have to be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    MyTextFormFild(
                      controllName: controllDate,
                      whatType: 'Choos The date Time',
                      prefixIcon: const Icon(Icons.date_range_outlined),
                      validator: (value) {
                        if ((value.toString()).isEmpty) {
                          return 'It does not have to be empty';
                        } else {
                          return null;
                        }
                      },
                      onTap: () {
                        selectDate();
                      },
                    ),
                    MyTextFormFild(
                      keyboardType: TextInputType.emailAddress,
                      whatType: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if ((value.toString()).isEmpty) {
                          return 'It does not have to be empty';
                        } else if (!((value.toString())
                            .contains('@gmail.com'))) {
                          return 'Email must contain @gmail.com';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    MyTextFormFild(
                      keyboardType: TextInputType.visiblePassword,
                      whatType: 'password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isobscureText = !isobscureText;
                            });
                          },
                          icon: Icon(isobscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off)),
                      validator: (value) {
                        if ((value.toString()).isEmpty) {
                          return 'It does not have to be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: isobscureText,
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyMaterialButton(
                      loginOrSign: 'LOGIN',
                      style: AppTextStyle.White26Bold,
                      onPressed: () {
                        if (Formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(
                                  name: name,
                                  number: email,
                                  dateTime: dateTime,
                                ),
                              ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectDate() async {
    dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2050),
    );
    if (dateTime != null) {
      setState(() {
        controllDate.text = dateTime.toString().split(' ')[0];
      });
    }
  }
}
