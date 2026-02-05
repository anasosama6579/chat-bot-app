import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/icon_text_widget.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/suggestions_questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              .map(
                (e) => SuggestionsQuestionsWidget(
                  onTap: () {
                    context.read<ChatCubit>().textEditingController.text = e;
                    context.read<ChatCubit>().emitChatStates();
                  },
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
