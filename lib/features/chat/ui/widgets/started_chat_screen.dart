import 'package:chat_bot_app/core/helper/spacing.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/ai_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/loading_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/resend_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartedChatScreen extends StatelessWidget {
  const StartedChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = context.read<ChatCubit>();
        final messages = cubit.messages;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: messages.length + (state is ChatLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  final isLoading = (state is ChatLoading && index == messages.length);

                  if (isLoading) {
                    return const LoadingMessage();
                  }

                  final message = messages[index];
                  final isUserMessage = index % 2 == 0;

                  final isLastMessage = (index == messages.length - 1);
                  if (isLastMessage && state is ChatFailure && isUserMessage) {
                    return ResendMessage(message: message,);
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
      },
    );

  }
}

// Usermessage(text: context.read<ChatCubit>().recoverTextEditingController.text),
// state.when(initial: () => InitialChatScreen(),
// loading: () => Loadingmessage(),
// success: (response) => Aimessage(text: response.candidates![0].content!.parts![0].text),
// failure: (String message) => Resendmessage()),
