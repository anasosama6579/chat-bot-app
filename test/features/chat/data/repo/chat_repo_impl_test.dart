import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart' as req;
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart' as res;
import 'package:chat_bot_app/features/chat/data/repo/chat_repo_impl.dart';
import 'package:chat_bot_app/features/chat/data/services/chat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatService extends Mock implements ChatService{}
class FakeChatRequestBody extends Fake implements req.ChatRequestBody {}

void main() {
  late MockChatService mockChatService;
  late ChatRepoImpl chatRepo;

  setUpAll(() {
    registerFallbackValue(FakeChatRequestBody());
  });

  setUp(() {
    mockChatService = MockChatService();
    chatRepo = ChatRepoImpl(chatService: mockChatService);
  });

  group('Input Validation Tests', () {
    test('should return failure when request contents are empty', () async {
      final emptyRequest = req.ChatRequestBody(contents: []);
      final result = await chatRepo.chat(emptyRequest);
      expect(result, isA<Failure>());
    });
  });

  group('Output Validation Tests', () {
    test('should return failure when candidates list is empty', () async {
      final emptyResponse = res.ChatResponse([], null, '', '');
      final request = req.ChatRequestBody(
        contents: [
          req.Content(
            role: 'user',
            parts: [req.Part(text: 'Hello')],
          ),
        ],
      );

      when(
        () => mockChatService.chat(any()),
      ).thenAnswer((_) async => emptyResponse);

      final result = await chatRepo.chat(request);

      expect(result, isA<Failure>());
    });

    test('should return failure when the first candidate has no text', () async {
        final invalidResponse = res.ChatResponse(
          [
            res.Candidate(res.Content([res.Part("", "")], 'model'), '', 0),
          ],
          null,
          '',
          '',
        );

        final request = req.ChatRequestBody(
          contents: [
            req.Content(
              role: 'user',
              parts: [req.Part(text: 'Hello')],
            ),
          ],
        );

        when(
          () => mockChatService.chat(any()),
        ).thenAnswer((_) async => invalidResponse);

        final result = await chatRepo.chat(request);

        expect(result, isA<Failure>());
      },
    );
  });
}
