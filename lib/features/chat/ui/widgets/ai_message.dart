import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/robot_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiMessage extends StatelessWidget {
  const AiMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 18.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
          decoration: BoxDecoration(
            color: AppColors.filledGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
          ),
          child: MarkdownBody(
            data: text,
            styleSheet: MarkdownStyleSheet(p: AppStyles.font13BoldDarkGrey),
          ),
        ),
        Positioned(left: 29.w, bottom: 0, child: RobotAvatar()),
      ],
    );
  }
}
