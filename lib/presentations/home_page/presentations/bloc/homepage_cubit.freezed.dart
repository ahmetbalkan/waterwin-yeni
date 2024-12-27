// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homepage_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomepageState {
  HomepageStatus get status => throw _privateConstructorUsedError;
  bool get isButtonEnabled => throw _privateConstructorUsedError;
  int get remainingSeconds => throw _privateConstructorUsedError;
  List<PointResponseModel> get points => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get totalDays => throw _privateConstructorUsedError;
  BottleModel get bottle => throw _privateConstructorUsedError;

  /// Create a copy of HomepageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomepageStateCopyWith<HomepageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageStateCopyWith<$Res> {
  factory $HomepageStateCopyWith(
          HomepageState value, $Res Function(HomepageState) then) =
      _$HomepageStateCopyWithImpl<$Res, HomepageState>;
  @useResult
  $Res call(
      {HomepageStatus status,
      bool isButtonEnabled,
      int remainingSeconds,
      List<PointResponseModel> points,
      int totalPoints,
      int totalDays,
      BottleModel bottle});
}

/// @nodoc
class _$HomepageStateCopyWithImpl<$Res, $Val extends HomepageState>
    implements $HomepageStateCopyWith<$Res> {
  _$HomepageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomepageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isButtonEnabled = null,
    Object? remainingSeconds = null,
    Object? points = null,
    Object? totalPoints = null,
    Object? totalDays = null,
    Object? bottle = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomepageStatus,
      isButtonEnabled: null == isButtonEnabled
          ? _value.isButtonEnabled
          : isButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointResponseModel>,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalDays: null == totalDays
          ? _value.totalDays
          : totalDays // ignore: cast_nullable_to_non_nullable
              as int,
      bottle: null == bottle
          ? _value.bottle
          : bottle // ignore: cast_nullable_to_non_nullable
              as BottleModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomepageStateImplCopyWith<$Res>
    implements $HomepageStateCopyWith<$Res> {
  factory _$$HomepageStateImplCopyWith(
          _$HomepageStateImpl value, $Res Function(_$HomepageStateImpl) then) =
      __$$HomepageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomepageStatus status,
      bool isButtonEnabled,
      int remainingSeconds,
      List<PointResponseModel> points,
      int totalPoints,
      int totalDays,
      BottleModel bottle});
}

/// @nodoc
class __$$HomepageStateImplCopyWithImpl<$Res>
    extends _$HomepageStateCopyWithImpl<$Res, _$HomepageStateImpl>
    implements _$$HomepageStateImplCopyWith<$Res> {
  __$$HomepageStateImplCopyWithImpl(
      _$HomepageStateImpl _value, $Res Function(_$HomepageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomepageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isButtonEnabled = null,
    Object? remainingSeconds = null,
    Object? points = null,
    Object? totalPoints = null,
    Object? totalDays = null,
    Object? bottle = null,
  }) {
    return _then(_$HomepageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomepageStatus,
      isButtonEnabled: null == isButtonEnabled
          ? _value.isButtonEnabled
          : isButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remainingSeconds: null == remainingSeconds
          ? _value.remainingSeconds
          : remainingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointResponseModel>,
      totalPoints: null == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      totalDays: null == totalDays
          ? _value.totalDays
          : totalDays // ignore: cast_nullable_to_non_nullable
              as int,
      bottle: null == bottle
          ? _value.bottle
          : bottle // ignore: cast_nullable_to_non_nullable
              as BottleModel,
    ));
  }
}

/// @nodoc

class _$HomepageStateImpl implements _HomepageState {
  const _$HomepageStateImpl(
      {required this.status,
      required this.isButtonEnabled,
      required this.remainingSeconds,
      required final List<PointResponseModel> points,
      required this.totalPoints,
      required this.totalDays,
      required this.bottle})
      : _points = points;

  @override
  final HomepageStatus status;
  @override
  final bool isButtonEnabled;
  @override
  final int remainingSeconds;
  final List<PointResponseModel> _points;
  @override
  List<PointResponseModel> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final int totalPoints;
  @override
  final int totalDays;
  @override
  final BottleModel bottle;

  @override
  String toString() {
    return 'HomepageState(status: $status, isButtonEnabled: $isButtonEnabled, remainingSeconds: $remainingSeconds, points: $points, totalPoints: $totalPoints, totalDays: $totalDays, bottle: $bottle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isButtonEnabled, isButtonEnabled) ||
                other.isButtonEnabled == isButtonEnabled) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.totalDays, totalDays) ||
                other.totalDays == totalDays) &&
            (identical(other.bottle, bottle) || other.bottle == bottle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      isButtonEnabled,
      remainingSeconds,
      const DeepCollectionEquality().hash(_points),
      totalPoints,
      totalDays,
      bottle);

  /// Create a copy of HomepageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageStateImplCopyWith<_$HomepageStateImpl> get copyWith =>
      __$$HomepageStateImplCopyWithImpl<_$HomepageStateImpl>(this, _$identity);
}

abstract class _HomepageState implements HomepageState {
  const factory _HomepageState(
      {required final HomepageStatus status,
      required final bool isButtonEnabled,
      required final int remainingSeconds,
      required final List<PointResponseModel> points,
      required final int totalPoints,
      required final int totalDays,
      required final BottleModel bottle}) = _$HomepageStateImpl;

  @override
  HomepageStatus get status;
  @override
  bool get isButtonEnabled;
  @override
  int get remainingSeconds;
  @override
  List<PointResponseModel> get points;
  @override
  int get totalPoints;
  @override
  int get totalDays;
  @override
  BottleModel get bottle;

  /// Create a copy of HomepageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomepageStateImplCopyWith<_$HomepageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
