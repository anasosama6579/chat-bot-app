import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 29.w, left: 70.w, top: 9.h, bottom: 9.h),
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          right: 20.w,
          left: 20.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.mainBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
          ),
        ),
        child: Text(text, style: AppStyles.font13BoldWhite),
      ),
    );
  }
}
