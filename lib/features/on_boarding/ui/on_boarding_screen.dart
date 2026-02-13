import 'package:chat_bot_app/core/assets/assets.dart';
import 'package:chat_bot_app/core/helper/extensions.dart';
import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/core/routing/routes.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:chat_bot_app/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 35.h),
        child: Column(
          children: [
            verticalSpacing(45),
            Text("You AI Assistant", style: AppStyles.font23BoldMainBlue),
            verticalSpacing(14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                "Using this software,you can ask you questions and receive articles using artificial intelligence assistant",
                style: AppStyles.font15MediumLightGrey,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpacing(85),
            // SvgPicture.asset(Assets.onboardingSvg,)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: Image.asset(Assets.onboardingImage, fit: BoxFit.cover),
            ),
            Spacer(),
            CustomElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(Routes.chatScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
