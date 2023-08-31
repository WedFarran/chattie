import 'package:chattie/core/strings/colors.dart';
import 'package:flutter/material.dart';
import '../strings/images.dart';
import '../utils/styles.dart';

class ChattieAppBar extends StatelessWidget {
  const ChattieAppBar(
      {super.key,
      required this.size,
      required this.screenName,
      required this.backButtonVisible});

  final Size size;
  final String screenName;
  final bool backButtonVisible;

  @override
  Widget build(BuildContext context) {
    return backButtonVisible == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: BLUE,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  screenName,
                  style: APPBARFONT,
                ),
              ),
              Image.asset(
                BLUE_LOGO,
                width: size.width * 0.3,
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  screenName,
                  style: APPBARFONT,
                ),
              ),
              Image.asset(
                BLUE_LOGO,
                width: size.width * 0.3,
              )
            ],
          );
  }
}
