import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:chat_bot_app/core/networking/api_client.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';

class MockApiClient extends Mock implements ApiClient {}
class MockDioException extends Mock implements DioException {}
class MockResponse<T> extends Mock implements Response<T> {}

class FakeChatRequestBody extends Fake implements ChatRequestBody {}

void main() {
  late MockApiClient mockApiClient;
  late ChatService chatService;

  setUpAll(() {
    registerFallbackValue(FakeChatRequestBody());
  });

  setUp(() {
    mockApiClient = MockApiClient();
    chatService = ChatService(mockApiClient);
  });

  group('ChatService Retry Logic Tests', () {
    final request = ChatRequestBody(contents: []);

    test('should return response immediately on success without retries', () async {

      final response = ChatResponse([], null, 'v1', 'id');
      when(() => mockApiClient.chat(any())).thenAnswer((_) async => response);

      final result = await chatService.chat(request);

      expect(result, equals(response));
      verify(() => mockApiClient.chat(any())).called(1);
    });

    test('should NOT retry and throw immediately on 400 Bad Request', () async {
      final mockDioError = MockDioException();
      final mockResponse = MockResponse();

      when(() => mockDioError.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioError.response).thenReturn(mockResponse);
      when(() => mockResponse.statusCode).thenReturn(400);

      when(() => mockApiClient.chat(any())).thenThrow(mockDioError);

      expect(() => chatService.chat(request), throwsA(isA<DioException>()));

      verify(() => mockApiClient.chat(any())).called(1);
    });

    test('should retry 3 times and fail on continuous 500 Server Errors', () async {
      final mockDioError = MockDioException();
      final mockResponse = MockResponse();

      when(() => mockDioError.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioError.response).thenReturn(mockResponse);
      when(() => mockResponse.statusCode).thenReturn(500);

      when(() => mockApiClient.chat(any())).thenThrow(mockDioError);


      await expectLater(() => chatService.chat(request), throwsA(isA<DioException>()));


      verify(() => mockApiClient.chat(any())).called(4);
    });

    test('should retry on timeout and eventually succeed', () async {
      final mockDioError = MockDioException();
      when(() => mockDioError.type).thenReturn(DioExceptionType.connectionTimeout);

      final successResponse = ChatResponse([], null, 'v1', 'id');

      int attemptCounter = 0;

      when(() => mockApiClient.chat(any())).thenAnswer((_) async {
        attemptCounter++;
        if (attemptCounter <= 2) {
          throw mockDioError;
        }
        return successResponse;
      });

      final result = await chatService.chat(request);

      expect(result, equals(successResponse));

      verify(() => mockApiClient.chat(any())).called(3);
    });
  });
}