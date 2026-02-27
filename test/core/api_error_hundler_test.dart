import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioException extends Mock implements DioException {}
class MockResponse<T> extends Mock implements Response<T> {}


void main() {
  group('ErrorHandler Tests', () {
    late MockDioException mockDioException;
    late MockResponse mockResponse;

    setUp(() {
      mockDioException = MockDioException();
      mockResponse = MockResponse();
    });

    test('should return DEFAULT error when exception is not a DioException', () {
      final genericException = Exception("Just a random crash");

      final handler = ErrorHandler.handle(genericException);
      expect(handler.apiErrorModel.code, ResponseCode.DEFAULT);
      expect(handler.apiErrorModel.message, ResponseMessage.DEFAULT);
    });

    test('should map connectionTimeout to CONNECT_TIMEOUT Failure', () {
      when(() => mockDioException.type).thenReturn(DioExceptionType.connectionTimeout);
      final handler = ErrorHandler.handle(mockDioException);

      expect(handler.apiErrorModel.code, ResponseCode.CONNECT_TIMEOUT);
      expect(handler.apiErrorModel.message, ResponseMessage.CONNECT_TIMEOUT);
    });

    test('should parse ApiErrorModel correctly from a badResponse', () {

      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(mockResponse);

      when(() => mockResponse.statusCode).thenReturn(400);
      when(() => mockResponse.statusMessage).thenReturn('Bad Request');
      when(() => mockResponse.data).thenReturn({
        "code": 400,
        "message": "Bad Request"
      });


      final handler = ErrorHandler.handle(mockDioException);


      expect(handler.apiErrorModel.code, 400);
      expect(handler.apiErrorModel.message, "Bad Request");
    });

    test('should fallback to DEFAULT if badResponse lacks response data', () {
      when(() => mockDioException.type).thenReturn(DioExceptionType.badResponse);
      when(() => mockDioException.response).thenReturn(null);

      final handler = ErrorHandler.handle(mockDioException);

      expect(handler.apiErrorModel.code, ResponseCode.DEFAULT);
      expect(handler.apiErrorModel.message, ResponseMessage.DEFAULT);
    });
  });
}