// ignore_for_file: file_names, non_constant_identifier_names

import 'package:chattie/core/strings/images.dart';
import 'package:chattie/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/blue_button.dart';
import '../../../core/widgets/bottom_navigation_bar.dart';
import '../../../core/widgets/orange_text_field.dart';

class OTPScreen extends StatefulWidget {
  static const String id = 'OTPScreen';
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController OTP1 = TextEditingController();
  final TextEditingController OTP2 = TextEditingController();
  final TextEditingController OTP3 = TextEditingController();
  final TextEditingController OTP4 = TextEditingController();

  @override
  void dispose() {
    OTP1.dispose();
    OTP2.dispose();
    OTP3.dispose();
    OTP4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    BLUE_LOGO,
                    height: size.height * 0.16,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.13,
                ),
                const Text(
                  'OTP',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoginTextField(
                      controller: OTP1,
                      width: size.width * 0.18,
                      height: size.height * 0.08,
                      validator: (OTP1) {
                        String otp1 = 'd';
                        if (loginNotifier.otpValidator(OTP1!, otp1)) {
                          return 'Wrong code';
                        }
                        return null;
                      },
                    ),
                    LoginTextField(
                      controller: OTP2,
                      width: size.width * 0.18,
                      height: size.height * 0.08,
                      validator: (OTP2) {
                        String otp1 = 'd';
                        if (loginNotifier.otpValidator(OTP2!, otp1)) {
                          return 'Wrong code';
                        }
                        return null;
                      },
                    ),
                    LoginTextField(
                      controller: OTP3,
                      width: size.width * 0.18,
                      height: size.height * 0.08,
                      validator: (OTP3) {
                        String otp1 = 'd';
                        if (loginNotifier.otpValidator(OTP3!, otp1)) {
                          return 'Wrong code';
                        }
                        return null;
                      },
                    ),
                    LoginTextField(
                      controller: OTP4,
                      width: size.width * 0.18,
                      height: size.height * 0.08,
                      validator: (OTP4) {
                        String otp1 = 'd';
                        if (loginNotifier.otpValidator(OTP4!, otp1)) {
                          return 'Wrong code';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                BlueButton(
                  size: size,
                  onTap: () => Navigator.pushNamed(
                      context, ChattieBottomNavigationBar.id),
                  buttonName: 'Login',
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
