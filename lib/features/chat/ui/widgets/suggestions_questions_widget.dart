import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionsQuestionsWidget extends StatelessWidget {
  const SuggestionsQuestionsWidget({super.key, required this.onTap, required this.question});
  final VoidCallback onTap;
  final String question;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric( vertical: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.filledGrey,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(child: Text(question,style: AppStyles.font14MediumGrey,)),
          ),
        ),
        verticalSpacing(8),
      ],
    );
  }
}
