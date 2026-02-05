# AI Chatbot Flutter App

A modern Flutter chatbot application powered by Google's Gemini AI API. This app provides an intuitive interface for users to interact with an AI assistant.

## Features

- 🤖 AI-powered chat using Google Gemini 3 Flash
- 💬 Clean and intuitive chat interface
- 🎨 Beautiful onboarding screen
- 📱 Responsive design using ScreenUtil
- 🏗️ Clean architecture with separation of concerns
- 🔄 State management using Bloc/Cubit
- 🌐 Robust API error handling
- 🎯 Type-safe API calls with Retrofit

## Screenshots

*Add your app screenshots here*

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Google Gemini API Key

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd chat_bot_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up your API Key**
   
   Open `lib/core/networking/api_constants.dart` and replace the API key with your own:
   ```dart
   static const String apiKey = "YOUR_GOOGLE_GEMINI_API_KEY";
   ```

4. **Generate required files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Configure splash screen** (Optional)
   ```bash
   flutter pub run flutter_native_splash:create
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── assets/
│   └── assets.dart                    # Asset path constants
├── core/
│   ├── di/
│   │   └── dependency_injection.dart  # Dependency injection setup
│   ├── helper/
│   │   ├── extensions.dart            # Dart extensions
│   │   └── spacing.dart               # Spacing utilities
│   ├── networking/
│   │   ├── api_constants.dart         # API endpoints and constants
│   │   ├── api_error_handler.dart     # Error handling logic
│   │   ├── api_error_model.dart       # Error model
│   │   ├── api_error_model.g.dart     # Generated error model
│   │   ├── api_result.dart            # Result wrapper
│   │   ├── api_result.freezed.dart    # Generated freezed code
│   │   ├── api_services.dart          # Retrofit API services
│   │   ├── api_services.g.dart        # Generated API code
│   │   └── dio_factory.dart           # Dio configuration
│   ├── routing/
│   │   ├── app_router.dart            # Route generator
│   │   └── routes.dart                # Route constants
│   ├── theming/
│   │   ├── app_colors.dart            # Color palette
│   │   └── app_styles.dart            # Text styles
│   └── widgets/
│       └── custom_elevated_button.dart # Custom button widget
├── features/
│   ├── chat/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   │   ├── chat_request_body.dart     # Request model
│   │   │   │   ├── chat_request_body.g.dart   # Generated
│   │   │   │   ├── chat_response_body.dart    # Response model
│   │   │   │   └── chat_response_body.g.dart  # Generated
│   │   │   └── repo/
│   │   │       └── chat_repo.dart             # Repository
│   │   ├── logic/
│   │   │   ├── chat_cubit.dart                # State management
│   │   │   ├── chat_state.dart                # State definitions
│   │   │   └── chat_state.freezed.dart        # Generated
│   │   └── ui/
│   │       ├── widgets/
│   │       │   ├── ai_message.dart            # AI message bubble
│   │       │   ├── chat_app_bar.dart          # Custom app bar
│   │       │   ├── chat_text_field.dart       # Message input field
│   │       │   ├── icon_text_widget.dart      # Icon + text widget
│   │       │   ├── initial_chat_screen.dart   # Empty state screen
│   │       │   ├── loading_message.dart       # Loading indicator
│   │       │   ├── resend_message.dart        # Resend functionality
│   │       │   ├── robot_avatar.dart          # AI avatar
│   │       │   ├── started_chat_screen.dart   # Active chat screen
│   │       │   ├── suggestions_questions_section.dart  # Suggestions
│   │       │   ├── suggestions_questions_widget.dart   # Question cards
│   │       │   └── user_message.dart          # User message bubble
│   │       └── chat_screen.dart               # Main chat screen
│   └── on_boarding/
│       └── ui/
│           └── on_boarding_screen.dart        # Onboarding screen
├── chat_bot_app.dart                          # App configuration
└── main.dart                                  # App entry point
```

## Key Components

### Chat Feature

The chat feature is organized into several reusable components:

**Message Components:**
- `ai_message.dart` - Displays AI responses with custom styling
- `user_message.dart` - Shows user messages with distinct appearance
- `loading_message.dart` - Animated loading indicator while waiting for AI response
- `resend_message.dart` - Retry mechanism for failed messages

**UI Components:**
- `chat_app_bar.dart` - Custom app bar with chat-specific actions
- `chat_text_field.dart` - Message input field with send functionality
- `robot_avatar.dart` - AI assistant avatar/icon
- `icon_text_widget.dart` - Reusable icon and text combination widget

**Screen States:**
- `initial_chat_screen.dart` - Welcome screen with suggestions before first message
- `started_chat_screen.dart` - Active conversation view with message history
- `suggestions_questions_section.dart` - Pre-defined question suggestions
- `suggestions_questions_widget.dart` - Individual suggestion cards

### State Management

The app uses **Cubit** (from flutter_bloc) for managing chat states:

**Chat States:**
- `Initial` - Welcome screen state before any interaction
- `Loading` - Waiting for AI response
- `Success` - Message successfully received and displayed
- `Error` - Error state with retry option

## Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

- **Presentation Layer**: UI components and widgets
- **Business Logic Layer**: Cubit for state management
- **Data Layer**: Models, API services, and data sources

### Key Design Patterns

- **Bloc/Cubit**: For state management with freezed states
- **Repository Pattern**: For data abstraction (`chat_repo.dart`)
- **Dependency Injection**: Using get_it in `dependency_injection.dart`
- **Freezed**: For immutable state classes and models
- **Retrofit**: For type-safe API calls
- **Factory Pattern**: For Dio instance creation (`dio_factory.dart`)

## Dependency Injection

The app uses **get_it** for dependency injection. All dependencies are registered in `lib/core/di/dependency_injection.dart`:

```dart
// Example setup (typical structure)
final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & API Services
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt()));
  
  // Repository
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(getIt()));
  
  // Cubit
  getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt()));
}
```

## Dependencies

### Core Dependencies
- `flutter_bloc` / `bloc` - State management (Cubit)
- `dio` - HTTP client for API calls
- `retrofit` - Type-safe REST client
- `freezed` - Code generation for immutable classes
- `json_annotation` - JSON serialization
- `get_it` - Dependency injection

### UI Dependencies
- `flutter_screenutil` - Responsive design and sizing
- `flutter_native_splash` - Native splash screen

### Development Dependencies
- `build_runner` - Code generation runner
- `freezed_annotation` - Freezed annotations
- `json_serializable` - JSON serialization generator
- `retrofit_generator` - Retrofit code generator
- `pretty_dio_logger` - HTTP request/response logging

## Complete Dependencies List

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.3
  bloc: ^8.1.2
  
  # Networking
  dio: ^5.4.0
  retrofit: ^4.0.3
  pretty_dio_logger: ^1.3.1
  
  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  
  # Dependency Injection
  get_it: ^7.6.4
  
  # UI
  flutter_screenutil: ^5.9.0
  flutter_native_splash: ^2.3.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code Generators
  build_runner: ^2.4.6
  freezed: ^2.4.5
  json_serializable: ^6.7.1
  retrofit_generator: ^8.0.4
  
  flutter_lints: ^3.0.0
```

## API Integration

The app uses **Google Gemini 1.5 Flash** API for AI responses.

### Request Format
```dart
ChatRequestBody(
  contents: [
    Content(
      parts: [Part(text: "Your message here")]
    )
  ]
)
```

### Response Handling
The app uses a custom `ApiResult` wrapper for handling success and error states:
- `ApiResult.success(data)` - Successful response
- `ApiResult.failure(error)` - Error response

## Error Handling

Comprehensive error handling for:
- Network timeouts
- Bad requests (400)
- Unauthorized access (401)
- Server errors (500)
- Rate limiting (429)
- No internet connection

## State Management

Using **Cubit** (from flutter_bloc) for state management with Freezed for immutable states.

### Chat States

Located in `lib/features/chat/logic/chat_state.dart`:

```dart
@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = Loading;
  const factory ChatState.success(ChatResponseBody data) = Success;
  const factory ChatState.error(String error) = Error;
}
```

### Chat Cubit

Located in `lib/features/chat/logic/chat_cubit.dart`:

The ChatCubit manages:
- Message sending and receiving
- Loading states during API calls
- Error handling and retry logic
- Message history management

### BlocBuilder Usage

Example from `chat_screen.dart`:
```dart
BlocBuilder<ChatCubit, ChatState>(
  builder: (context, state) {
    return state.maybeWhen(
      initial: () => InitialChatScreen(),
      loading: () => LoadingMessage(),
      success: (data) => StartedChatScreen(),
      error: (error) => ResendMessage(),
      orElse: () => SizedBox(),
    );
  },
)
```

## Configuration

### API Constants
Located in `lib/core/networking/api_constants.dart`:
- Base URL
- API endpoints
- API key
- Error messages

### Theme
Located in `lib/core/theming/`:
- App colors
- Text styles
- Component themes

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Security Considerations

1. **Never commit API keys** - Use environment variables
2. **Implement rate limiting** - Prevent API abuse
3. **Validate user input** - Sanitize chat messages
4. **Use HTTPS** - All API calls are secure
5. **Error message sanitization** - Don't expose sensitive info

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Known Issues

- Make sure to replace the hardcoded API key with environment variables
- API endpoint in `api_constants.dart` points to `gemini-3-flash-preview` which may need updating

## Future Enhancements

- [ ] Add message persistence 
- [ ] Implement conversation history
- [ ] Add image support in chat
- [ ] Multi-language support
- [ ] Dark mode
- [ ] Voice input
- [ ] Export chat conversations
- [ ] User authentication


## Acknowledgments

- Google Gemini AI for the powerful language model
- Flutter community for amazing packages
- All contributors who help improve this project

