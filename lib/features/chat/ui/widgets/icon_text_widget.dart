import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({super.key, required this.icon, required this.text});
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(icon,),
        verticalSpacing(5),
        Text(text,style:AppStyles.font14BoldDarkGrey ,),
      ],
    );
  }
}
