import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/logic/chat_cubit.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_app_bar.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/chat_text_field.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/initial_chat_screen.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/started_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Content> _messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          _scrollToBottom();
          state.whenOrNull(
            success: (responseBody) {
              final aiText =
                  responseBody.candidates?.first.content?.parts?.first.text ?? "";
              _messages.add(
                Content(role: "model", parts: [Part(text: aiText)]));
            },
            // failure: (message) => _messages.length > 1 ? _messages.removeLast() : null,
            initial: () => _messages.clear(),
          );
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: SizedBox.expand(
              child: Stack(
                children: [
                  _messages.isEmpty
                      ? InitialChatScreen(onSuggestionTap: _sendMessage)
                      : StartedChatScreen(
                          messages: _messages,
                          state: state,
                          scrollController: _scrollController,
                        ),
                  Positioned(
                    left: 18.w,
                    right: 18.w,
                    bottom: 0,
                    child: ChatTextField(onSend: _sendMessage),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _sendMessage(String text) {
    _messages.add(Content(role: "user", parts: [Part(text: text)]));
    final requestBody = ChatRequestBody(contents: _messages);
    context.read<ChatCubit>().emitChatStates(requestBody);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
