import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class LoginForgetAndRememberSection extends StatelessWidget {
  const LoginForgetAndRememberSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(
            //padding: const EdgeInsets.all(2.0),
            height: 16.0,
            width: 16.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.borderColor,width: 1.0)
            ),
            child: const Center(child: Icon(Icons.done,color: AppColors.iconDoneColor,size: 10.0,)),
          ),
          const SizedBox(width:8.0 ,),
          const Text('Remember me',style: TextStyle(
              fontSize: 13.0,
              color: AppColors.darkPrimary,
              fontWeight: FontWeight.w500
          ),)
        ],),
        TextButton(onPressed: (){}, child: const Text('Forgot password?',
          style: TextStyle(
              fontSize: 14.0,
              color:AppColors.subTitleColor
          ),))
      ],
    );
  }
}
