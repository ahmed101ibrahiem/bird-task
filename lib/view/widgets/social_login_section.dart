import 'package:bird_task/view/widgets/social_login_button_widget.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_constants.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'OR',style: TextStyle(color: AppColors.darkPrimary,fontSize: 14.0,
            fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 24.0,),
        SocialLoginButton(text: 'Continue with Google',
          iconPath: AppConstants.googleIcon,
          buttonColor: AppColors.white,
          textColor: AppColors.darkPrimary,
        ),
        const SizedBox(height: 28.0,),
        SocialLoginButton(text: 'Sign In with Apple ID',
          iconPath: AppConstants.appleIcon,
          buttonColor: AppColors.darkPrimary,
          iconColor: AppColors.white,
        ),
        const SizedBox(height: 28.0,),
        InkWell(
          onTap: (){
            // test get token
            // final myToken =await cubit.getToken();
            // if (kDebugMode) {
            //   print(myToken);
            // }
          },
          child: SocialLoginButton(text: 'Continue with Facebook',
            iconPath: AppConstants.facebookIcon,
            buttonColor: AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
