import 'dart:async';

import 'package:chattie/core/strings/images.dart';
import 'package:chattie/features/auth/presentation/phone_number.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushNamed(PhoneNumberAuth.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF030877),
      body: Center(
        child: Image.asset(
          LOGO,
          height: size.height * 0.2,
        ),
      ),
    );
  }
}
