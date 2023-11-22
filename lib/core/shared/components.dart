import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_color.dart';

Future showToast({required String message, Color color = Colors.black}) {
  return Fluttertoast.showToast(
    msg: message.trim(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 14,
  );
}

OutlineInputBorder textFormBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color:AppColors.borderColor ,strokeAlign: 1.0)
    );
}

void navigateTo(context, widget)=>
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));


Future<void> navigateAndReplacement(context,widget){
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget,));
}