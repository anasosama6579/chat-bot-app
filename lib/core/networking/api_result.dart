import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chat_bot_app/core/networking/api_error_hundler.dart';

part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = _Success<T>;
  const factory ApiResult.failure(ErrorHandler error) = Failure<T>;
}
