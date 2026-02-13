import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/logic/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;

  ChatCubit(this._chatRepo) : super(ChatState.initial());



  Future<void> emitChatStates(ChatRequestBody chatRequestBody) async {
    emit(ChatState.loading());
    final data = await _chatRepo.chat(chatRequestBody);
    data.when(
      success: (data) => emit(ChatState.success(data)),
      failure: (error) => emit(
        ChatState.failure(
          error.apiErrorModel.message ?? "Something went wrong",
        ),
      ),
    );
  }

  void emitInitial() => emit(ChatState.initial());

}
