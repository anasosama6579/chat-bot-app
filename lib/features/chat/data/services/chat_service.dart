import 'package:chat_bot_app/core/networking/api_client.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart' ;
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart' hide Content;
import 'package:dio/dio.dart';

class ChatService {
  final ApiClient apiClient;

  ChatService(this.apiClient);

  Future<ChatResponse> chat(ChatRequestBody chatRequestBody) async {
    const int maxRetries = 3;
    int attempt = 0;

    while (attempt <= maxRetries) {
      try {
        var response = await apiClient.chat(chatRequestBody);
        return response;
      } catch (error) {
        attempt++;


        if (attempt > maxRetries || !_isRetryable(error)) {
          rethrow;
        }

        await Future.delayed(Duration(seconds: 4));
      }
    }

    throw Exception("Failed after $maxRetries retries");
  }

  bool _isRetryable(dynamic error) {

    if (error is! DioException) return false;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return true;

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        if (statusCode != null) {
          if (statusCode >= 500 && statusCode < 600) {
            return true;
          }
          if (statusCode >= 400 && statusCode < 500) {
            return false;
          }
        }
        return false;

      default:
        return false;
    }
  }

}
