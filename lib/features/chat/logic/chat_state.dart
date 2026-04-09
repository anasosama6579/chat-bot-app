import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = ChatInitial<T>;
  const factory ChatState.loading() = ChatLoading<T>;
  const factory ChatState.success(T data) = ChatSuccess<T>;
  const factory ChatState.failure(String message) = ChatFailure<T>;
}
