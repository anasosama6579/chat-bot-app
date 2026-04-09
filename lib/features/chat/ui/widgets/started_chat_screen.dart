import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/ai_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/loading_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/resend_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartedChatScreen extends StatelessWidget {
  final List<Content> messages;
  final ChatState state;
  final ScrollController scrollController;

  const StartedChatScreen({
    super.key,
    required this.messages,
    required this.state,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: messages.length + ((state is ChatLoading) ? 1 : 0),
            itemBuilder: (context, index) {
              if (state is ChatLoading && index == messages.length) {
                return const LoadingMessage();
              }
              final Content content = messages[index];
              final String message = content.parts?.first.text ?? "";
              final bool isUserMessage = content.role == "user";
              final bool isLastMessage = (index == messages.length - 1);
              if (isLastMessage && state is ChatFailure && isUserMessage) {
                return ResendMessage(
                  message: message,
                  onResend: () {
                    final requestBody = ChatRequestBody(contents: messages);
                    context.read<ChatCubit>().emitChatStates(requestBody);
                  },
                );
              }

              return isUserMessage
                  ? UserMessage(text: message)
                  : AiMessage(text: message);
            },
          ),
        ),
        verticalSpacing(60),
      ],
    );
  }
}
