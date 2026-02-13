import 'package:chat_bot_app/core/assets/assets.dart';
import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,

      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(Assets.leftArrow),
        padding: EdgeInsets.zero,
      ),
      title: Row(
        children: [
          Image.asset(Assets.robotImage, height: 36.h, width: 24.w),
          horizontalSpacing(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Chat Bot", style: AppStyles.font20BoldMainBlue),
              Row(
                children: [
                  CircleAvatar(backgroundColor: AppColors.green, radius: 3.r),
                  horizontalSpacing(5),
                  Text("Online", style: AppStyles.font17MediumGreen),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.volume),
          padding: EdgeInsets.zero,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.export),
          padding: EdgeInsets.zero,
        ),
        horizontalSpacing(8),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(color: AppColors.lightestGrey, height: 1, thickness: 1),
      ),
    );
  }
}
