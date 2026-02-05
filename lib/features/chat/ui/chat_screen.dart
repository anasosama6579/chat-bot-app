import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_app_bar.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_text_field.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/initial_chat_screen.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/started_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ChatAppBar(),
          body: Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: SizedBox.expand(
              child: Stack(
                children: [
                  ?state.maybeWhen(
                    initial: () => InitialChatScreen(),
                    orElse: () => StartedChatScreen(),
                  ),
                  Positioned(
                    left: 18.w,
                    right: 18.w,
                    bottom: 0,
                    child: ChatTextField(
                      sendOnPressed: () =>
                          context.read<ChatCubit>().emitChatStates(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
