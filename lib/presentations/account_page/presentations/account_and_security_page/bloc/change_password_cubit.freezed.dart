// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangePasswordState {
  ChangePasswordStatus get status => throw _privateConstructorUsedError;
  bool get oldPasswordObscure => throw _privateConstructorUsedError;
  bool get new1PasswordObscure => throw _privateConstructorUsedError;
  bool get new2PasswordObscure => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordStateCopyWith<ChangePasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordStateCopyWith<$Res> {
  factory $ChangePasswordStateCopyWith(
          ChangePasswordState value, $Res Function(ChangePasswordState) then) =
      _$ChangePasswordStateCopyWithImpl<$Res, ChangePasswordState>;
  @useResult
  $Res call(
      {ChangePasswordStatus status,
      bool oldPasswordObscure,
      bool new1PasswordObscure,
      bool new2PasswordObscure,
      String errorMessage});
}

/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res, $Val extends ChangePasswordState>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? oldPasswordObscure = null,
    Object? new1PasswordObscure = null,
    Object? new2PasswordObscure = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChangePasswordStatus,
      oldPasswordObscure: null == oldPasswordObscure
          ? _value.oldPasswordObscure
          : oldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      new1PasswordObscure: null == new1PasswordObscure
          ? _value.new1PasswordObscure
          : new1PasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      new2PasswordObscure: null == new2PasswordObscure
          ? _value.new2PasswordObscure
          : new2PasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordStateImplCopyWith<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  factory _$$ChangePasswordStateImplCopyWith(_$ChangePasswordStateImpl value,
          $Res Function(_$ChangePasswordStateImpl) then) =
      __$$ChangePasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChangePasswordStatus status,
      bool oldPasswordObscure,
      bool new1PasswordObscure,
      bool new2PasswordObscure,
      String errorMessage});
}

/// @nodoc
class __$$ChangePasswordStateImplCopyWithImpl<$Res>
    extends _$ChangePasswordStateCopyWithImpl<$Res, _$ChangePasswordStateImpl>
    implements _$$ChangePasswordStateImplCopyWith<$Res> {
  __$$ChangePasswordStateImplCopyWithImpl(_$ChangePasswordStateImpl _value,
      $Res Function(_$ChangePasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? oldPasswordObscure = null,
    Object? new1PasswordObscure = null,
    Object? new2PasswordObscure = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ChangePasswordStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChangePasswordStatus,
      oldPasswordObscure: null == oldPasswordObscure
          ? _value.oldPasswordObscure
          : oldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      new1PasswordObscure: null == new1PasswordObscure
          ? _value.new1PasswordObscure
          : new1PasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      new2PasswordObscure: null == new2PasswordObscure
          ? _value.new2PasswordObscure
          : new2PasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordStateImpl implements _ChangePasswordState {
  const _$ChangePasswordStateImpl(
      {required this.status,
      required this.oldPasswordObscure,
      required this.new1PasswordObscure,
      required this.new2PasswordObscure,
      required this.errorMessage});

  @override
  final ChangePasswordStatus status;
  @override
  final bool oldPasswordObscure;
  @override
  final bool new1PasswordObscure;
  @override
  final bool new2PasswordObscure;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ChangePasswordState(status: $status, oldPasswordObscure: $oldPasswordObscure, new1PasswordObscure: $new1PasswordObscure, new2PasswordObscure: $new2PasswordObscure, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.oldPasswordObscure, oldPasswordObscure) ||
                other.oldPasswordObscure == oldPasswordObscure) &&
            (identical(other.new1PasswordObscure, new1PasswordObscure) ||
                other.new1PasswordObscure == new1PasswordObscure) &&
            (identical(other.new2PasswordObscure, new2PasswordObscure) ||
                other.new2PasswordObscure == new2PasswordObscure) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, oldPasswordObscure,
      new1PasswordObscure, new2PasswordObscure, errorMessage);

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      __$$ChangePasswordStateImplCopyWithImpl<_$ChangePasswordStateImpl>(
          this, _$identity);
}

abstract class _ChangePasswordState implements ChangePasswordState {
  const factory _ChangePasswordState(
      {required final ChangePasswordStatus status,
      required final bool oldPasswordObscure,
      required final bool new1PasswordObscure,
      required final bool new2PasswordObscure,
      required final String errorMessage}) = _$ChangePasswordStateImpl;

  @override
  ChangePasswordStatus get status;
  @override
  bool get oldPasswordObscure;
  @override
  bool get new1PasswordObscure;
  @override
  bool get new2PasswordObscure;
  @override
  String get errorMessage;

  /// Create a copy of ChangePasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordStateImplCopyWith<_$ChangePasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
