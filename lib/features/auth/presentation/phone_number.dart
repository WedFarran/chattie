import 'package:chattie/core/strings/images.dart';
import 'package:chattie/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/blue_button.dart';
import '../../../core/widgets/orange_text_field.dart';
import 'OTP_screen.dart';

class PhoneNumberAuth extends StatefulWidget {
  static const String id = 'PhoneNumberAuth';
  const PhoneNumberAuth({super.key});

  @override
  State<PhoneNumberAuth> createState() => _PhoneNumberAuthState();
}

class _PhoneNumberAuthState extends State<PhoneNumberAuth> {
  final TextEditingController phoneNumber = TextEditingController();

  @override
  void dispose() {
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0, left: 30, right: 30),
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
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    const Text(
                      'Phone number',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    LoginTextField(
                      controller: phoneNumber,
                      width: size.width,
                      height: size.height * 0.065,
                      validator: (phoneNumber) {
                        if (loginNotifier.phoneNumberValidator(phoneNumber!)) {
                          return 'Please add your phone number in the correct format';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    BlueButton(
                      size: size,
                      onTap: () => Navigator.pushNamed(context, OTPScreen.id),
                      buttonName: 'Verify',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
