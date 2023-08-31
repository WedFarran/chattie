import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  phoneNumberValidator(String phoneNumber) {
    if (phoneNumber.isEmpty) return false;
    if (phoneNumber.length != 10) return false;
    if (phoneNumber.substring(0, 1) != '05') return false;
    return true;
  }

  otpValidator(String otp, String sentOtp) {
    if (otp.contains(sentOtp)) return true;
    return false;
  }
}
