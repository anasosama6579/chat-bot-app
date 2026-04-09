import 'package:chat_bot_app/core/assets/assets.dart';
import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/suggestions_questions_section.dart';
import 'package:flutter/material.dart';

class InitialChatScreen extends StatelessWidget {
  const InitialChatScreen({super.key, required this.onSuggestionTap});
  final Function(String) onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpacing(19),
          SuggestionsQuestionsSection(
            icon: Assets.explain,
            sectionName: "Explain",
            onQuestionTap: onSuggestionTap,
            questions: [
              "Explain Quantum Physics",
              "What are wormholes explain like I am 5",
            ],
          ),
          SuggestionsQuestionsSection(
            icon: Assets.edit,
            sectionName: "Write & edit",
            onQuestionTap: onSuggestionTap,
            questions: [
              "Write a tweet about global warming",
              "Write a poem about flower and love",
              "Write a rap song lyrics about",
            ],
          ),
          SuggestionsQuestionsSection(
            icon: Assets.translate,
            sectionName: "Translate",
            onQuestionTap: onSuggestionTap,
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
    );
  }
}
