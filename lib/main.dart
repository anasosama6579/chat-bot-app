import 'package:chat_bot_app/chat_bot_app.dart';
import 'package:chat_bot_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ChatBotApp(appRouter: AppRouter()),
    );
  }
}

