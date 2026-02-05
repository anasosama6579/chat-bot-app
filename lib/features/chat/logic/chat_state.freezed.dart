// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState<$T>()';
}


}

/// @nodoc
class $ChatStateCopyWith<T,$Res>  {
$ChatStateCopyWith(ChatState<T> _, $Res Function(ChatState<T>) __);
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns<T> on ChatState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatInitial<T> value)?  initial,TResult Function( ChatLoading<T> value)?  loading,TResult Function( ChatSuccess<T> value)?  success,TResult Function( ChatFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatInitial() when initial != null:
return initial(_that);case ChatLoading() when loading != null:
return loading(_that);case ChatSuccess() when success != null:
return success(_that);case ChatFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatInitial<T> value)  initial,required TResult Function( ChatLoading<T> value)  loading,required TResult Function( ChatSuccess<T> value)  success,required TResult Function( ChatFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case ChatInitial():
return initial(_that);case ChatLoading():
return loading(_that);case ChatSuccess():
return success(_that);case ChatFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatInitial<T> value)?  initial,TResult? Function( ChatLoading<T> value)?  loading,TResult? Function( ChatSuccess<T> value)?  success,TResult? Function( ChatFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case ChatInitial() when initial != null:
return initial(_that);case ChatLoading() when loading != null:
return loading(_that);case ChatSuccess() when success != null:
return success(_that);case ChatFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatInitial() when initial != null:
return initial();case ChatLoading() when loading != null:
return loading();case ChatSuccess() when success != null:
return success(_that.data);case ChatFailure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ChatInitial():
return initial();case ChatLoading():
return loading();case ChatSuccess():
return success(_that.data);case ChatFailure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ChatInitial() when initial != null:
return initial();case ChatLoading() when loading != null:
return loading();case ChatSuccess() when success != null:
return success(_that.data);case ChatFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ChatInitial<T> implements ChatState<T> {
  const ChatInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState<$T>.initial()';
}


}




/// @nodoc


class ChatLoading<T> implements ChatState<T> {
  const ChatLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState<$T>.loading()';
}


}




/// @nodoc


class ChatSuccess<T> implements ChatState<T> {
  const ChatSuccess(this.data);
  

 final  T data;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSuccessCopyWith<T, ChatSuccess<T>> get copyWith => _$ChatSuccessCopyWithImpl<T, ChatSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ChatState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChatSuccessCopyWith<T,$Res> implements $ChatStateCopyWith<T, $Res> {
  factory $ChatSuccessCopyWith(ChatSuccess<T> value, $Res Function(ChatSuccess<T>) _then) = _$ChatSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ChatSuccessCopyWithImpl<T,$Res>
    implements $ChatSuccessCopyWith<T, $Res> {
  _$ChatSuccessCopyWithImpl(this._self, this._then);

  final ChatSuccess<T> _self;
  final $Res Function(ChatSuccess<T>) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ChatSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ChatFailure<T> implements ChatState<T> {
  const ChatFailure(this.message);
  

 final  String message;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatFailureCopyWith<T, ChatFailure<T>> get copyWith => _$ChatFailureCopyWithImpl<T, ChatFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatFailure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatState<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatFailureCopyWith<T,$Res> implements $ChatStateCopyWith<T, $Res> {
  factory $ChatFailureCopyWith(ChatFailure<T> value, $Res Function(ChatFailure<T>) _then) = _$ChatFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatFailureCopyWithImpl<T,$Res>
    implements $ChatFailureCopyWith<T, $Res> {
  _$ChatFailureCopyWithImpl(this._self, this._then);

  final ChatFailure<T> _self;
  final $Res Function(ChatFailure<T>) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatFailure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
