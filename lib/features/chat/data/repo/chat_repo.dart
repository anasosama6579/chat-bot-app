import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';

class ChatRepo {
  final ChatService _chatService;

  ChatRepo({required ChatService chatService}) : _chatService = chatService;

  Future<ApiResult<ChatResponse>> chat (ChatRequestBody chatRequestBody) async{
    try{
      var response = await _chatService.chat(chatRequestBody);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}