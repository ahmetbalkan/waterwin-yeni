// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PointState {
  PointStatus get status => throw _privateConstructorUsedError;
  int get gainedPoints => throw _privateConstructorUsedError;
  int get referancePoints => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get isButtonEnabled => throw _privateConstructorUsedError;

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointStateCopyWith<PointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointStateCopyWith<$Res> {
  factory $PointStateCopyWith(
          PointState value, $Res Function(PointState) then) =
      _$PointStateCopyWithImpl<$Res, PointState>;
  @useResult
  $Res call(
      {PointStatus status,
      int gainedPoints,
      int referancePoints,
      int totalPoints,
      String errorMessage,
      bool isButtonEnabled});
}

/// @nodoc
class _$PointStateCopyWithImpl<$Res, $Val extends PointState>
    implements $PointStateCopyWith<$Res> {
  _$PointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? gainedPoints = null,
    Object? referancePoints = null,
    Object? totalPoints = null,
    Object? errorMessage = null,
    Object? isButtonEnabled = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PointStatus,
      gainedPoints: null == gainedPoints
          ? _value.gainedPoints
          : gainedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      referancePoints: null == referancePoints
          ? _value.referancePoints
          : referancePoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isButtonEnabled: null == isButtonEnabled
          ? _value.isButtonEnabled
          : isButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointStateImplCopyWith<$Res>
    implements $PointStateCopyWith<$Res> {
  factory _$$PointStateImplCopyWith(
          _$PointStateImpl value, $Res Function(_$PointStateImpl) then) =
      __$$PointStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PointStatus status,
      int gainedPoints,
      int referancePoints,
      int totalPoints,
      String errorMessage,
      bool isButtonEnabled});
}

/// @nodoc
class __$$PointStateImplCopyWithImpl<$Res>
    extends _$PointStateCopyWithImpl<$Res, _$PointStateImpl>
    implements _$$PointStateImplCopyWith<$Res> {
  __$$PointStateImplCopyWithImpl(
      _$PointStateImpl _value, $Res Function(_$PointStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? gainedPoints = null,
    Object? referancePoints = null,
    Object? totalPoints = null,
    Object? errorMessage = null,
    Object? isButtonEnabled = null,
  }) {
    return _then(_$PointStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PointStatus,
      gainedPoints: null == gainedPoints
          ? _value.gainedPoints
          : gainedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      referancePoints: null == referancePoints
          ? _value.referancePoints
          : referancePoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isButtonEnabled: null == isButtonEnabled
          ? _value.isButtonEnabled
          : isButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PointStateImpl implements _PointState {
  const _$PointStateImpl(
      {required this.status,
      required this.gainedPoints,
      required this.referancePoints,
      required this.totalPoints,
      required this.errorMessage,
      required this.isButtonEnabled});

  @override
  final PointStatus status;
  @override
  final int gainedPoints;
  @override
  final int referancePoints;
  @override
  final int totalPoints;
  @override
  final String errorMessage;
  @override
  final bool isButtonEnabled;

  @override
  String toString() {
    return 'PointState(status: $status, gainedPoints: $gainedPoints, referancePoints: $referancePoints, totalPoints: $totalPoints, errorMessage: $errorMessage, isButtonEnabled: $isButtonEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gainedPoints, gainedPoints) ||
                other.gainedPoints == gainedPoints) &&
            (identical(other.referancePoints, referancePoints) ||
                other.referancePoints == referancePoints) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isButtonEnabled, isButtonEnabled) ||
                other.isButtonEnabled == isButtonEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, gainedPoints,
      referancePoints, totalPoints, errorMessage, isButtonEnabled);

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointStateImplCopyWith<_$PointStateImpl> get copyWith =>
      __$$PointStateImplCopyWithImpl<_$PointStateImpl>(this, _$identity);
}

abstract class _PointState implements PointState {
  const factory _PointState(
      {required final PointStatus status,
      required final int gainedPoints,
      required final int referancePoints,
      required final int totalPoints,
      required final String errorMessage,
      required final bool isButtonEnabled}) = _$PointStateImpl;

  @override
  PointStatus get status;
  @override
  int get gainedPoints;
  @override
  int get referancePoints;
  @override
  int get totalPoints;
  @override
  String get errorMessage;
  @override
  bool get isButtonEnabled;

  /// Create a copy of PointState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointStateImplCopyWith<_$PointStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
