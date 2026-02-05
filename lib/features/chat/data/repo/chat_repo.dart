import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/core/networking/api_services.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response_body.dart';

class ChatRepo {
  final ApiServices apiServices;

  ChatRepo(this.apiServices);

  Future<ApiResult<ChatResponseBody>> chat (ChatRequestBody chatRequestBody) async{
    try{
      var response = await apiServices.chat(chatRequestBody);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}