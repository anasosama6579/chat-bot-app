import 'package:chat_bot_app/assets/assets.dart';
import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_app_bar.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_text_field.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/suggestions_questions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Padding(
        padding:  EdgeInsets.only(bottom: 35.h),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpacing(19),
                  SuggestionsQuestionsSection(
                    icon: Assets.explain,
                    sectionName: "Explain",
                    onTap: () {},
                    questions: [
                      "Explain Quantum Physics",
                      "What are wormholes explain like I am 5",
                    ],
                  ),
                  SuggestionsQuestionsSection(
                    icon: Assets.edit,
                    sectionName: "Write & edit",
                    onTap: () {},
                    questions: [
                      "Write a tweet about global warming",
                      "Write a poem about flower and love",
                      "Write a rap song lyrics about",
                    ],
                  ),
                  SuggestionsQuestionsSection(
                    icon: Assets.translate,
                    sectionName: "Translate",
                    onTap: () {},
                    questions: [
                      'How do you say "how are you" in korean?',
                      "Write a poem about flower and love",
                      "Write a rap song lyrics about",
                      "How do you say 'how are you' in spanish?",
                    ],
                  ),
                  verticalSpacing(19),
                ],
              ),
            ),
            Positioned(
              left: 18.w,
              right: 18.w,
              bottom: 0,
              child: ChatTextField()
            ),
          ],
        ),
      ),
    );
  }
}
