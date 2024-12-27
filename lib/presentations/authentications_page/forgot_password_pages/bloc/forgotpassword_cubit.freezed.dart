// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgotpassword_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordState {
  ForgotPasswordStatus get status => throw _privateConstructorUsedError;
  OtpResendStatus get otpResendStatus => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get timerValue => throw _privateConstructorUsedError;
  bool get isResendButtonActive => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call(
      {ForgotPasswordStatus status,
      OtpResendStatus otpResendStatus,
      String errorMessage,
      int timerValue,
      bool isResendButtonActive,
      String email});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? otpResendStatus = null,
    Object? errorMessage = null,
    Object? timerValue = null,
    Object? isResendButtonActive = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordStatus,
      otpResendStatus: null == otpResendStatus
          ? _value.otpResendStatus
          : otpResendStatus // ignore: cast_nullable_to_non_nullable
              as OtpResendStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timerValue: null == timerValue
          ? _value.timerValue
          : timerValue // ignore: cast_nullable_to_non_nullable
              as int,
      isResendButtonActive: null == isResendButtonActive
          ? _value.isResendButtonActive
          : isResendButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordStateImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$ForgotPasswordStateImplCopyWith(_$ForgotPasswordStateImpl value,
          $Res Function(_$ForgotPasswordStateImpl) then) =
      __$$ForgotPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ForgotPasswordStatus status,
      OtpResendStatus otpResendStatus,
      String errorMessage,
      int timerValue,
      bool isResendButtonActive,
      String email});
}

/// @nodoc
class __$$ForgotPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ForgotPasswordStateImpl>
    implements _$$ForgotPasswordStateImplCopyWith<$Res> {
  __$$ForgotPasswordStateImplCopyWithImpl(_$ForgotPasswordStateImpl _value,
      $Res Function(_$ForgotPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? otpResendStatus = null,
    Object? errorMessage = null,
    Object? timerValue = null,
    Object? isResendButtonActive = null,
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ForgotPasswordStatus,
      otpResendStatus: null == otpResendStatus
          ? _value.otpResendStatus
          : otpResendStatus // ignore: cast_nullable_to_non_nullable
              as OtpResendStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      timerValue: null == timerValue
          ? _value.timerValue
          : timerValue // ignore: cast_nullable_to_non_nullable
              as int,
      isResendButtonActive: null == isResendButtonActive
          ? _value.isResendButtonActive
          : isResendButtonActive // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordStateImpl implements _ForgotPasswordState {
  const _$ForgotPasswordStateImpl(
      {required this.status,
      required this.otpResendStatus,
      required this.errorMessage,
      required this.timerValue,
      required this.isResendButtonActive,
      required this.email});

  @override
  final ForgotPasswordStatus status;
  @override
  final OtpResendStatus otpResendStatus;
  @override
  final String errorMessage;
  @override
  final int timerValue;
  @override
  final bool isResendButtonActive;
  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordState(status: $status, otpResendStatus: $otpResendStatus, errorMessage: $errorMessage, timerValue: $timerValue, isResendButtonActive: $isResendButtonActive, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.otpResendStatus, otpResendStatus) ||
                other.otpResendStatus == otpResendStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.timerValue, timerValue) ||
                other.timerValue == timerValue) &&
            (identical(other.isResendButtonActive, isResendButtonActive) ||
                other.isResendButtonActive == isResendButtonActive) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, otpResendStatus,
      errorMessage, timerValue, isResendButtonActive, email);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      __$$ForgotPasswordStateImplCopyWithImpl<_$ForgotPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgotPasswordState implements ForgotPasswordState {
  const factory _ForgotPasswordState(
      {required final ForgotPasswordStatus status,
      required final OtpResendStatus otpResendStatus,
      required final String errorMessage,
      required final int timerValue,
      required final bool isResendButtonActive,
      required final String email}) = _$ForgotPasswordStateImpl;

  @override
  ForgotPasswordStatus get status;
  @override
  OtpResendStatus get otpResendStatus;
  @override
  String get errorMessage;
  @override
  int get timerValue;
  @override
  bool get isResendButtonActive;
  @override
  String get email;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
