import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;

  ChatCubit(this._chatRepo) : super(ChatState.initial());

  TextEditingController textEditingController = TextEditingController();
  List<String> messages = [];
  String? _lastUserMessage;


  // void emitChatStates() async {
  //   final text = textEditingController.text.trim();
  //   final recoverText = recoverTextEditingController.text.trim();
  //   if (text.isEmpty && recoverText.isEmpty) return;
  //   emit(ChatState.loading());
  //   recoverTextEditingController.text = textEditingController.text;
  //   messages.add(textEditingController.text);
  //   textEditingController.clear();
  //   var data = await _chatRepo.chat(
  //     ChatRequestBody(
  //       contents: [
  //         Content(
  //           parts: [
  //             Part(
  //               text: textEditingController.text.isNotEmpty
  //                   ? textEditingController.text
  //                   : recoverTextEditingController.text,
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  //   data.when(
  //     success: (chatResponse) {
  //       emit(ChatState.success(chatResponse));
  //       messages.add(chatResponse.candidates![0].content!.parts![0].text!);
  //     },
  //     failure: (error) => emit(
  //       ChatState.failure(
  //         error.apiErrorModel.message ?? "Something went wrong",
  //       ),
  //     ),
  //   );
  // }

  void emitChatStates() async {
    final text = textEditingController.text.trim();
    if (text.isEmpty && _lastUserMessage == null) return;

    final messageToSend = text.isNotEmpty ? text : _lastUserMessage!;
    _lastUserMessage = messageToSend;

    if (text.isNotEmpty) {
      messages.add(text);
      textEditingController.clear();
    }

    emit(ChatState.loading());

    final result = await _chatRepo.chat(
      ChatRequestBody(
        contents: [
          Content(
            parts: [Part(text: messageToSend)],
          ),
        ],
      ),
    );

    result.when(
      success: (response) {
        messages.add(
          response.candidates![0].content!.parts![0].text!,
        );
        emit(ChatState.success(response));
      },
      failure: (error) {
        emit(ChatState.failure(
          error.apiErrorModel.message ?? "Something went wrong",
        ));
      },
    );
  }

  void emitInitialChatStates() {
    emit(ChatState.initial());
    messages.clear();
    textEditingController.clear();
    _lastUserMessage = null;
  }


}
