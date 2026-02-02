import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  AppStyles._();

  static TextStyle font23BoldMainBlue = TextStyle(
    fontFamily: "Nunito",
    fontSize: 23.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.mainBlue,
  );

 static TextStyle font15MediumLightGrey = TextStyle(
   fontFamily: "Nunito",
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGrey,
  );

  static TextStyle font19BoldWhite = TextStyle(
    fontFamily: "Nunito",
    fontSize: 19.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

}