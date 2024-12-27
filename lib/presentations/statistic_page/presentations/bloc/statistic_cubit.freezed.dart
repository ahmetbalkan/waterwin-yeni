// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatisticState {
  StatisticStatus get status => throw _privateConstructorUsedError;
  TabStatus get tabStatus => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get dailyGoal => throw _privateConstructorUsedError;
  List<BottleModel> get bottles => throw _privateConstructorUsedError;
  List<WaterIntakeModel> get dailyWaterIntakeData =>
      throw _privateConstructorUsedError;

  /// Create a copy of StatisticState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticStateCopyWith<StatisticState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticStateCopyWith<$Res> {
  factory $StatisticStateCopyWith(
          StatisticState value, $Res Function(StatisticState) then) =
      _$StatisticStateCopyWithImpl<$Res, StatisticState>;
  @useResult
  $Res call(
      {StatisticStatus status,
      TabStatus tabStatus,
      String message,
      int dailyGoal,
      List<BottleModel> bottles,
      List<WaterIntakeModel> dailyWaterIntakeData});
}

/// @nodoc
class _$StatisticStateCopyWithImpl<$Res, $Val extends StatisticState>
    implements $StatisticStateCopyWith<$Res> {
  _$StatisticStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tabStatus = null,
    Object? message = null,
    Object? dailyGoal = null,
    Object? bottles = null,
    Object? dailyWaterIntakeData = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatisticStatus,
      tabStatus: null == tabStatus
          ? _value.tabStatus
          : tabStatus // ignore: cast_nullable_to_non_nullable
              as TabStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      bottles: null == bottles
          ? _value.bottles
          : bottles // ignore: cast_nullable_to_non_nullable
              as List<BottleModel>,
      dailyWaterIntakeData: null == dailyWaterIntakeData
          ? _value.dailyWaterIntakeData
          : dailyWaterIntakeData // ignore: cast_nullable_to_non_nullable
              as List<WaterIntakeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticStateImplCopyWith<$Res>
    implements $StatisticStateCopyWith<$Res> {
  factory _$$StatisticStateImplCopyWith(_$StatisticStateImpl value,
          $Res Function(_$StatisticStateImpl) then) =
      __$$StatisticStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatisticStatus status,
      TabStatus tabStatus,
      String message,
      int dailyGoal,
      List<BottleModel> bottles,
      List<WaterIntakeModel> dailyWaterIntakeData});
}

/// @nodoc
class __$$StatisticStateImplCopyWithImpl<$Res>
    extends _$StatisticStateCopyWithImpl<$Res, _$StatisticStateImpl>
    implements _$$StatisticStateImplCopyWith<$Res> {
  __$$StatisticStateImplCopyWithImpl(
      _$StatisticStateImpl _value, $Res Function(_$StatisticStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tabStatus = null,
    Object? message = null,
    Object? dailyGoal = null,
    Object? bottles = null,
    Object? dailyWaterIntakeData = null,
  }) {
    return _then(_$StatisticStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatisticStatus,
      tabStatus: null == tabStatus
          ? _value.tabStatus
          : tabStatus // ignore: cast_nullable_to_non_nullable
              as TabStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      dailyGoal: null == dailyGoal
          ? _value.dailyGoal
          : dailyGoal // ignore: cast_nullable_to_non_nullable
              as int,
      bottles: null == bottles
          ? _value._bottles
          : bottles // ignore: cast_nullable_to_non_nullable
              as List<BottleModel>,
      dailyWaterIntakeData: null == dailyWaterIntakeData
          ? _value._dailyWaterIntakeData
          : dailyWaterIntakeData // ignore: cast_nullable_to_non_nullable
              as List<WaterIntakeModel>,
    ));
  }
}

/// @nodoc

class _$StatisticStateImpl implements _StatisticState {
  const _$StatisticStateImpl(
      {required this.status,
      required this.tabStatus,
      required this.message,
      required this.dailyGoal,
      required final List<BottleModel> bottles,
      required final List<WaterIntakeModel> dailyWaterIntakeData})
      : _bottles = bottles,
        _dailyWaterIntakeData = dailyWaterIntakeData;

  @override
  final StatisticStatus status;
  @override
  final TabStatus tabStatus;
  @override
  final String message;
  @override
  final int dailyGoal;
  final List<BottleModel> _bottles;
  @override
  List<BottleModel> get bottles {
    if (_bottles is EqualUnmodifiableListView) return _bottles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bottles);
  }

  final List<WaterIntakeModel> _dailyWaterIntakeData;
  @override
  List<WaterIntakeModel> get dailyWaterIntakeData {
    if (_dailyWaterIntakeData is EqualUnmodifiableListView)
      return _dailyWaterIntakeData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyWaterIntakeData);
  }

  @override
  String toString() {
    return 'StatisticState(status: $status, tabStatus: $tabStatus, message: $message, dailyGoal: $dailyGoal, bottles: $bottles, dailyWaterIntakeData: $dailyWaterIntakeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tabStatus, tabStatus) ||
                other.tabStatus == tabStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.dailyGoal, dailyGoal) ||
                other.dailyGoal == dailyGoal) &&
            const DeepCollectionEquality().equals(other._bottles, _bottles) &&
            const DeepCollectionEquality()
                .equals(other._dailyWaterIntakeData, _dailyWaterIntakeData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      tabStatus,
      message,
      dailyGoal,
      const DeepCollectionEquality().hash(_bottles),
      const DeepCollectionEquality().hash(_dailyWaterIntakeData));

  /// Create a copy of StatisticState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticStateImplCopyWith<_$StatisticStateImpl> get copyWith =>
      __$$StatisticStateImplCopyWithImpl<_$StatisticStateImpl>(
          this, _$identity);
}

abstract class _StatisticState implements StatisticState {
  const factory _StatisticState(
          {required final StatisticStatus status,
          required final TabStatus tabStatus,
          required final String message,
          required final int dailyGoal,
          required final List<BottleModel> bottles,
          required final List<WaterIntakeModel> dailyWaterIntakeData}) =
      _$StatisticStateImpl;

  @override
  StatisticStatus get status;
  @override
  TabStatus get tabStatus;
  @override
  String get message;
  @override
  int get dailyGoal;
  @override
  List<BottleModel> get bottles;
  @override
  List<WaterIntakeModel> get dailyWaterIntakeData;

  /// Create a copy of StatisticState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticStateImplCopyWith<_$StatisticStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
