import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class LoginHeadSection extends StatelessWidget {
  const LoginHeadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Welcome Back!',style: TextStyle(
            fontSize: 24.0,
            color:AppColors.textColor
        ),),
        SizedBox(height: 8.0,),
        Text('Login to continue Radio App',
          style: TextStyle(
              fontSize: 16.0,
              color: AppColors.textColor
          ),),
        SizedBox(height: 32.0,),
      ],
    );
  }
}
