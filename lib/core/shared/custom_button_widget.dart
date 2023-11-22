import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/app_color.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.fun,
    required this.isLoad
  });

  final String text;
  final Function fun;
  final bool isLoad;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: AppColors.darkBlueShadow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          ),
          onPressed: () {
            fun();
          },
          child:isLoad?  const SpinKitThreeBounce(
            color: Colors.white,
            size: 24.0,
          ):  Text(
            text,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
