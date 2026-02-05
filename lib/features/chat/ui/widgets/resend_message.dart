import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendMessage extends StatelessWidget {
  const ResendMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.only(right: 29.w, left: 70.w, top: 9.h, bottom: 9.h),
          padding: EdgeInsets.only(top: 10.h,bottom: 5.h, right: 20.w,left: 20.w),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
              bottomLeft: Radius.circular(30.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(message, style: AppStyles.font13BoldRed),
              verticalSpacing(5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () => context.read<ChatCubit>().emitChatStates(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh, color: AppColors.white),
                      horizontalSpacing(5),
                      Text("Resend", style: AppStyles.font13BoldWhite),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
