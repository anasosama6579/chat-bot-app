import 'package:chat_bot_app/chat_bot_app.dart';
import 'package:chat_bot_app/core/di/dependency_injection.dart';
import 'package:chat_bot_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
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
      title: 'Flutter Demo',
      home: ChatBotApp(appRouter: AppRouter()),
    );
  }
}
//? request body
/// content List <Map<String,dynamic>>
   /// parts List<Map<String,dynamic>>
      /// Text String

//? response body
/// candidates List<Map<String,dynamic>>
  /// content Map<String,dynamic>
      /// parts List<Map<String,dynamic>>
          /// text String
          /// thought signature String
      /// role String
  /// finish response String
  /// index int
/// usage meta data Map<String,dynamic>
  /// prompt token count int
  /// candidates token count int
  /// total token cont int
  /// prompt token details List<Map<String,dynamic>>
      /// modality String
      /// token count int
  /// thoughts token count int
/// model version String
/// response ID String