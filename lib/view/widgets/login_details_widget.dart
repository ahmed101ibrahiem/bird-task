import 'package:bird_task/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class LoginDetailsWidget extends StatelessWidget {
  const LoginDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0,bottom: 40.0),
      child: Column(
        children: [
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: AppColors.darkPrimary, fontSize: 14.0)),
            TextSpan(
                text: 'Sign up',
                style: TextStyle(color: AppColors.purpleColor, fontSize: 14.0)),
          ])),
          const SizedBox(height: 32.0,),
          Opacity(
            opacity: 0.66,
            child: RichText(
              textAlign: TextAlign.center,
                text: const TextSpan(children: [
              TextSpan(
                  text: "By signing up you indicate that you have read and\n agreed to the Patch ",
                  style: TextStyle(color: AppColors.darkPrimary, fontSize: 10.0)),
              TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                      color: AppColors.purpleColor, fontSize: 10.0,)),
            ])),
          ),

        ],
      ),
    );
  }
}

