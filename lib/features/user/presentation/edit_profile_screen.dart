import 'package:flutter/material.dart';

import '../../../core/strings/colors.dart';
import '../../../core/widgets/blue_button.dart';
import 'widgets/edit_textfueld_widget.dart';

class EditProfileScreen extends StatelessWidget {
  static const String id = 'EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              InkWell(
                onTap: () {},
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: BLUE,
                    radius: 70,
                  ),
                ),
              ),
              const EditTextField(
                hint: 'Abed Farran',
              ),
              const EditTextField(
                hint: '50',
              ),
              const EditTextField(
                hint: '1989/8/8',
              ),
              const EditTextField(
                hint: 'Saudi',
              ),
              const EditTextField(
                hint: 'Makkah',
              ),
              const EditTextField(
                hint: 'Driving',
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: BlueButton(
                  size: size,
                  onTap: () {},
                  buttonName: 'Modify',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
