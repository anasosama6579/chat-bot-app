import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/icon_text_widget.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/suggestions_questions_widget.dart';
import 'package:flutter/material.dart';

class SuggestionsQuestionsSection extends StatelessWidget {
  const SuggestionsQuestionsSection({
    super.key,
    required this.icon,
    required this.sectionName,
    required this.onTap,
    required this.questions,
  });

  final String icon;
  final String sectionName;
  final List<String> questions;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTextWidget(icon: icon, text: sectionName),
        verticalSpacing(19),
        Column(
          children: questions
              .map((e) => SuggestionsQuestionsWidget(onTap: onTap, question: e))
              .toList(),
        ),
        verticalSpacing(37),
      ],
    );
  }
}
