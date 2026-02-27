import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';

class ChatRepoImpl extends ChatRepo{
  final ChatService _chatService;

  ChatRepoImpl({required ChatService chatService}) : _chatService = chatService;

  @override
  Future<ApiResult<ChatResponse>> chat (ChatRequestBody chatRequestBody) async{
    if (chatRequestBody.contents == null || chatRequestBody.contents!.isEmpty) {
      return ApiResult.failure(ErrorHandler.handle(Exception("Request cannot be empty.")));
    }
    try{
      var response = await _chatService.chat(chatRequestBody);
      if (response.candidates == null || response.candidates!.isEmpty) {
        return ApiResult.failure(ErrorHandler.handle(Exception("Received empty candidates from the server.")));
      }

      final responseText = response.candidates?.first.content?.parts?.first.text;
      if (responseText == null || responseText.isEmpty) {
        return ApiResult.failure(ErrorHandler.handle(Exception("Received an empty message from the server.")));
      }
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}