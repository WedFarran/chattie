// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle APPBARFONT = const TextStyle(fontSize: 20, color: Colors.grey);
TextStyle appStyle(double size, Color color, FontWeight fw) {
  return TextStyle(fontSize: size.sp, color: color, fontWeight: fw);
}
