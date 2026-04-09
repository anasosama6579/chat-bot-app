import 'package:chat_bot_app/core/assets/assets.dart';
import 'package:chat_bot_app/core/theming/app_colors.dart';
import 'package:chat_bot_app/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key, required this.onSend});

  final Function(String) onSend;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22.w, right: 5.w),
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
              controller: _controller,
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
            key: Key("Send Button"),
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(Assets.send),
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                widget.onSend(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
