import 'package:chat_bot_app/assets/assets.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 22.w,right: 5.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: 3,
              minLines: 1,
              cursorColor: AppColors.mainBlue,
              style: AppStyles.font13BoldMainBlue,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19.h),
                hintText: "Hello chatGPT,how are you today?",
                hintStyle: AppStyles.font13BoldMainBlue,
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(Assets.microphone),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(Assets.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
