import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/icon_text_widget.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/suggestions_questions_widget.dart';
import 'package:flutter/material.dart';

class SuggestionsQuestionsSection extends StatelessWidget {
  const SuggestionsQuestionsSection({
    super.key,
    required this.icon,
    required this.sectionName,
    required this.questions,
    required this.onQuestionTap, // NEW
  });

  final String icon;
  final String sectionName;
  final List<String> questions;

  final Function(String) onQuestionTap; // NEW

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTextWidget(icon: icon, text: sectionName),
        verticalSpacing(19),
        Column(
          children: questions
              .map(
                (e) => SuggestionsQuestionsWidget(
              onTap: () => onQuestionTap(e), // Use callback
              question: e,
            ),
          )
              .toList(),
        ),
        verticalSpacing(37),
      ],
    );
  }
}