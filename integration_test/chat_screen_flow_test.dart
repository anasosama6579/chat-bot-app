import 'package:chat_bot_app/chat_bot_app.dart';
import 'package:chat_bot_app/core/di/dependency_injection.dart';
import 'package:chat_bot_app/core/networking/api_error_hundler.dart';
import 'package:chat_bot_app/core/networking/api_result.dart';
import 'package:chat_bot_app/core/routing/app_router.dart';
import 'package:chat_bot_app/core/widgets/custom_elevated_button.dart';
import 'package:chat_bot_app/features/chat/data/models/chat_request_body.dart'
    hide Content, Part;
import 'package:chat_bot_app/features/chat/data/models/chat_response.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo.dart';
import 'package:chat_bot_app/features/chat/data/repo/chat_repo_impl.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/ai_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/loading_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/resend_message.dart';
import 'package:chat_bot_app/features/chat/ui/widgets/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class MockChatRepo extends Mock implements ChatRepoImpl {}

class FakeChatRequestBody extends Fake implements ChatRequestBody {}

void main() async {
  await ScreenUtil.ensureScreenSize();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockChatRepo mockChatRepo;
  setUpAll(() async {
    registerFallbackValue(FakeChatRequestBody());
    setupGeIt();
    await getIt.unregister<ChatRepo>();
    mockChatRepo = MockChatRepo();
    getIt.registerLazySingleton<ChatRepo>(() => mockChatRepo);
  });
  group("Test Sending message Flow", () {
    testWidgets("Send message and loading bubble message", (tester) async {
      when(() => mockChatRepo.chat(any())).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 2), () {
          return ApiResult.success(
            ChatResponse(
              [
                Candidate(
                  Content([Part("aiText", null)], "model"),
                  "finishReason",
                  0,
                ),
              ],
              UsageMetadata(10, 20, 30, [PromptTokenDetail("text", 10)], 0),
              "gemini-1.5-flash",
              "test-response-id-123",
            ),
          );
        });
      });

      await tester.pumpWidget(
        MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(LoadingMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
    });

    testWidgets("Send message and receive AI message", (tester) async {
      when(() => mockChatRepo.chat(any())).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 2), () {
          return ApiResult.success(
            ChatResponse(
              [
                Candidate(
                  Content([
                    Part("aiText", null), // The dummy text your UI will read
                  ], "model"),
                  "finishReason",
                  0,
                ),
              ],
              UsageMetadata(10, 20, 30, [PromptTokenDetail("text", 10)], 0),
              "gemini-1.5-flash",
              "test-response-id-123",
            ),
          );
        });
      });

      await tester.pumpWidget(
        MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(LoadingMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      expect(
        find.descendant(
          of: find.byType(AiMessage),
          matching: find.text("aiText"),
        ),
        findsOneWidget,
      );
      expect(find.byType(AiMessage), findsOneWidget);
    });

    testWidgets("Send message and find Failure", (tester) async {
      when(() => mockChatRepo.chat(any())).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 2), () {
          return ApiResult.failure(ErrorHandler.handle("Error"));
        });
      });

      await tester.pumpWidget(
        MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(LoadingMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      expect(find.byType(ResendMessage), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ResendMessage),
          matching: find.text("Hello"),
        ),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
    });

    testWidgets(
      "Send message and find failed then resend message then failed",
      (tester) async {
        int counter = 0;
        when(() => mockChatRepo.chat(any())).thenAnswer((_) async {
          await Future.delayed(Duration(seconds: 2));
          if (counter == 0) {
            counter++;
            return ApiResult.failure(ErrorHandler.handle("Error"));
          }
          return ApiResult.failure(ErrorHandler.handle("Error"));
        });

        await tester.pumpWidget(
          MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(CustomElevatedButton));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField), "Hello");
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(Key("Send Button")));
        await tester.pump();
        expect(find.byType(UserMessage), findsOneWidget);
        expect(find.byType(LoadingMessage), findsOneWidget);
        await tester.pump(Duration(seconds: 3));
        expect(find.byType(ResendMessage), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(ResendMessage),
            matching: find.text("Hello"),
          ),
          findsOneWidget,
        );
        await tester.tap(find.byType(TextButton));
        await tester.pump();
        expect(find.byType(UserMessage), findsOneWidget);
        expect(find.byType(LoadingMessage), findsOneWidget);
        await tester.pump(Duration(seconds: 3));
        expect(find.byType(ResendMessage), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(ResendMessage),
            matching: find.text("Hello"),
          ),
          findsOneWidget,
        );
        await tester.pumpAndSettle();
      },
    );

    testWidgets("Send message and find failed then receive AI message ", (
      tester,
    ) async {
      int counter = 0;
      when(() => mockChatRepo.chat(any())).thenAnswer((_) async {
        await Future.delayed(Duration(seconds: 2));
        if (counter == 0) {
          counter++;
          return ApiResult.failure(ErrorHandler.handle("Error"));
        }
        return ApiResult.success(
          ChatResponse(
            [
              Candidate(
                Content([
                  Part("aiText", null), // The dummy text your UI will read
                ], "model"),
                "finishReason",
                0,
              ),
            ],
            UsageMetadata(10, 20, 30, [PromptTokenDetail("text", 10)], 0),
            "gemini-1.5-flash",
            "test-response-id-123",
          ),
        );
      });

      await tester.pumpWidget(
        MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(LoadingMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      expect(find.byType(ResendMessage), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(ResendMessage),
          matching: find.text("Hello"),
        ),
        findsOneWidget,
      );
      await tester.tap(find.byType(TextButton));
      await tester.pump();
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(LoadingMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      expect(find.byType(UserMessage), findsOneWidget);
      expect(find.byType(AiMessage), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(AiMessage),
          matching: find.text("aiText"),
        ),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
    });

    testWidgets("Send  2 message and receive AI message", (tester) async {
      when(() => mockChatRepo.chat(any())).thenAnswer((_) {
        return Future.delayed(Duration(seconds: 2), () {
          return ApiResult.success(
            ChatResponse(
              [
                Candidate(
                  Content([
                    Part("aiText", null), // The dummy text your UI will read
                  ], "model"),
                  "finishReason",
                  0,
                ),
              ],
              UsageMetadata(10, 20, 30, [PromptTokenDetail("text", 10)], 0),
              "gemini-1.5-flash",
              "test-response-id-123",
            ),
          );
        });
      });

      await tester.pumpWidget(
        MaterialApp(home: ChatBotApp(appRouter: AppRouter())),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomElevatedButton));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      await tester.pump(Duration(seconds: 3));
      await tester.enterText(find.byType(TextField), "Hello");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key("Send Button")));
      await tester.pump();
      expect(find.byType(UserMessage), findsAtLeast(1));
      expect(find.byType(LoadingMessage), findsOneWidget);
      expect(find.byType(AiMessage), findsOneWidget);
      await tester.pump(Duration(seconds: 3));
      expect(find.byType(UserMessage), findsExactly(2));
      expect(find.byType(AiMessage), findsExactly(2));
    });
  });
}
