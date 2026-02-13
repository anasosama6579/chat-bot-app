import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';



abstract class ChatRepo {
  Future<ApiResult<ChatResponse>> chat(ChatRequestBody chatRequestBody);
}

