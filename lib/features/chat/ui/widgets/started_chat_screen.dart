import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/ai_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/loading_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/resend_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/user_message.dart';
import 'package:flutter/material.dart';

class StartedChatScreen extends StatelessWidget {
  final List<Content> messages;
  final ChatState state;
  final Function(String) onResend;

  const StartedChatScreen({
    super.key,
    required this.messages,
    required this.state,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length + (state is ChatLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (state is ChatLoading && index == messages.length) {
                return const LoadingMessage();
              }
              final Content message = messages[index];
              final String text = message.parts?.first.text ?? "";
              final bool isUserMessage = message.role == "user";
              final bool isLastMessage = (index == messages.length - 1);

              if (isLastMessage && state is ChatFailure && isUserMessage) {
                return ResendMessage(
                  message: text,
                  onResend: () => onResend(text),
                );
              }

              return isUserMessage
                  ? UserMessage(text: text)
                  : AiMessage(text: text);
            },
          ),
        ),
        verticalSpacing(60),
      ],
    );
  }
}