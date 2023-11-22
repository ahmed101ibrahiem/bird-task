import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_color.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton(
      {super.key,
      required this.text,
      required this.buttonColor,
      this.textColor = AppColors.white,
      this.height = 32.0,
      required this.iconPath,
      this.iconColor});

  final String text;
  final String iconPath;
  final Color buttonColor;
  final Color textColor;
  Color? iconColor;

 final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        icon: SvgPicture.asset(
          iconPath,
          color: iconColor,
            height: height,
        ),
        label: Text(
          text,
          style: TextStyle(fontSize: 14.0, color: textColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
