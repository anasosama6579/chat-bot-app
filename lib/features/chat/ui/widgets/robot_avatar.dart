import 'package:chat_bot_app/assets/assets.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RobotAvatar extends StatelessWidget {
  const RobotAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
            )
          ]
      ),
      child: Image.asset(Assets.robotImage, fit: BoxFit.contain),
    );
  }
}
