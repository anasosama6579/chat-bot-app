import 'package:chat_bot_app/core/networking/api_client.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart' ;
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart' hide Content;

class ChatService {
  final ApiClient apiClient;

  ChatService(this.apiClient);

  Future<ChatResponse> chat(ChatRequestBody chatRequestBody) async {
    var response = await apiClient.chat(chatRequestBody);
    return response;
  }

}
