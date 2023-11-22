import 'package:bird_task/core/constants/app_color.dart';
import 'package:bird_task/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/image_backgrond_widget.dart';
import '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.lightScaffoldColor,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppConstants.backgroundImagePath))),
            child: LoginBody(),
          ),
        ));
  }
}
