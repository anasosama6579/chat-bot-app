import 'package:chat_bot_app/chat_bot_app.dart';
import 'package:chat_bot_app/core/di/dependency_injection.dart';
import 'package:chat_bot_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGeIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Bot App',
      home: ChatBotApp(appRouter: AppRouter()),
    );
  }
}
