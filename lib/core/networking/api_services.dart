import 'package:chat_bot_app/core/networking/api_constants.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.baseUrl)
  Future<ChatResponseBody> chat(@Body() ChatRequestBody chatRequestBody);
}
