// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfitListState {
  ProfitListStatus get statisticsStatus => throw _privateConstructorUsedError;
  List<ProfitStatisticModel>? get profitStatistics =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ProfitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitListStateCopyWith<ProfitListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitListStateCopyWith<$Res> {
  factory $ProfitListStateCopyWith(
          ProfitListState value, $Res Function(ProfitListState) then) =
      _$ProfitListStateCopyWithImpl<$Res, ProfitListState>;
  @useResult
  $Res call(
      {ProfitListStatus statisticsStatus,
      List<ProfitStatisticModel>? profitStatistics,
      String? errorMessage});
}

/// @nodoc
class _$ProfitListStateCopyWithImpl<$Res, $Val extends ProfitListState>
    implements $ProfitListStateCopyWith<$Res> {
  _$ProfitListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statisticsStatus = null,
    Object? profitStatistics = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      statisticsStatus: null == statisticsStatus
          ? _value.statisticsStatus
          : statisticsStatus // ignore: cast_nullable_to_non_nullable
              as ProfitListStatus,
      profitStatistics: freezed == profitStatistics
          ? _value.profitStatistics
          : profitStatistics // ignore: cast_nullable_to_non_nullable
              as List<ProfitStatisticModel>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitListStateImplCopyWith<$Res>
    implements $ProfitListStateCopyWith<$Res> {
  factory _$$ProfitListStateImplCopyWith(_$ProfitListStateImpl value,
          $Res Function(_$ProfitListStateImpl) then) =
      __$$ProfitListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfitListStatus statisticsStatus,
      List<ProfitStatisticModel>? profitStatistics,
      String? errorMessage});
}

/// @nodoc
class __$$ProfitListStateImplCopyWithImpl<$Res>
    extends _$ProfitListStateCopyWithImpl<$Res, _$ProfitListStateImpl>
    implements _$$ProfitListStateImplCopyWith<$Res> {
  __$$ProfitListStateImplCopyWithImpl(
      _$ProfitListStateImpl _value, $Res Function(_$ProfitListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statisticsStatus = null,
    Object? profitStatistics = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ProfitListStateImpl(
      statisticsStatus: null == statisticsStatus
          ? _value.statisticsStatus
          : statisticsStatus // ignore: cast_nullable_to_non_nullable
              as ProfitListStatus,
      profitStatistics: freezed == profitStatistics
          ? _value._profitStatistics
          : profitStatistics // ignore: cast_nullable_to_non_nullable
              as List<ProfitStatisticModel>?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfitListStateImpl implements _ProfitListState {
  const _$ProfitListStateImpl(
      {this.statisticsStatus = ProfitListStatus.initial,
      final List<ProfitStatisticModel>? profitStatistics,
      this.errorMessage})
      : _profitStatistics = profitStatistics;

  @override
  @JsonKey()
  final ProfitListStatus statisticsStatus;
  final List<ProfitStatisticModel>? _profitStatistics;
  @override
  List<ProfitStatisticModel>? get profitStatistics {
    final value = _profitStatistics;
    if (value == null) return null;
    if (_profitStatistics is EqualUnmodifiableListView)
      return _profitStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ProfitListState(statisticsStatus: $statisticsStatus, profitStatistics: $profitStatistics, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitListStateImpl &&
            (identical(other.statisticsStatus, statisticsStatus) ||
                other.statisticsStatus == statisticsStatus) &&
            const DeepCollectionEquality()
                .equals(other._profitStatistics, _profitStatistics) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statisticsStatus,
      const DeepCollectionEquality().hash(_profitStatistics), errorMessage);

  /// Create a copy of ProfitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitListStateImplCopyWith<_$ProfitListStateImpl> get copyWith =>
      __$$ProfitListStateImplCopyWithImpl<_$ProfitListStateImpl>(
          this, _$identity);
}

abstract class _ProfitListState implements ProfitListState {
  const factory _ProfitListState(
      {final ProfitListStatus statisticsStatus,
      final List<ProfitStatisticModel>? profitStatistics,
      final String? errorMessage}) = _$ProfitListStateImpl;

  @override
  ProfitListStatus get statisticsStatus;
  @override
  List<ProfitStatisticModel>? get profitStatistics;
  @override
  String? get errorMessage;

  /// Create a copy of ProfitListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitListStateImplCopyWith<_$ProfitListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
