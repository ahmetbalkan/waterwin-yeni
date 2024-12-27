// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReferanceState {
  ReferanceStatus get status => throw _privateConstructorUsedError;
  List<ReferralResponseModel> get referances =>
      throw _privateConstructorUsedError;
  String get referanceCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of ReferanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferanceStateCopyWith<ReferanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferanceStateCopyWith<$Res> {
  factory $ReferanceStateCopyWith(
          ReferanceState value, $Res Function(ReferanceState) then) =
      _$ReferanceStateCopyWithImpl<$Res, ReferanceState>;
  @useResult
  $Res call(
      {ReferanceStatus status,
      List<ReferralResponseModel> referances,
      String referanceCode,
      String message});
}

/// @nodoc
class _$ReferanceStateCopyWithImpl<$Res, $Val extends ReferanceState>
    implements $ReferanceStateCopyWith<$Res> {
  _$ReferanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? referances = null,
    Object? referanceCode = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferanceStatus,
      referances: null == referances
          ? _value.referances
          : referances // ignore: cast_nullable_to_non_nullable
              as List<ReferralResponseModel>,
      referanceCode: null == referanceCode
          ? _value.referanceCode
          : referanceCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferanceStateImplCopyWith<$Res>
    implements $ReferanceStateCopyWith<$Res> {
  factory _$$ReferanceStateImplCopyWith(_$ReferanceStateImpl value,
          $Res Function(_$ReferanceStateImpl) then) =
      __$$ReferanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReferanceStatus status,
      List<ReferralResponseModel> referances,
      String referanceCode,
      String message});
}

/// @nodoc
class __$$ReferanceStateImplCopyWithImpl<$Res>
    extends _$ReferanceStateCopyWithImpl<$Res, _$ReferanceStateImpl>
    implements _$$ReferanceStateImplCopyWith<$Res> {
  __$$ReferanceStateImplCopyWithImpl(
      _$ReferanceStateImpl _value, $Res Function(_$ReferanceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReferanceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? referances = null,
    Object? referanceCode = null,
    Object? message = null,
  }) {
    return _then(_$ReferanceStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferanceStatus,
      referances: null == referances
          ? _value._referances
          : referances // ignore: cast_nullable_to_non_nullable
              as List<ReferralResponseModel>,
      referanceCode: null == referanceCode
          ? _value.referanceCode
          : referanceCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReferanceStateImpl implements _ReferanceState {
  const _$ReferanceStateImpl(
      {required this.status,
      required final List<ReferralResponseModel> referances,
      required this.referanceCode,
      required this.message})
      : _referances = referances;

  @override
  final ReferanceStatus status;
  final List<ReferralResponseModel> _referances;
  @override
  List<ReferralResponseModel> get referances {
    if (_referances is EqualUnmodifiableListView) return _referances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referances);
  }

  @override
  final String referanceCode;
  @override
  final String message;

  @override
  String toString() {
    return 'ReferanceState(status: $status, referances: $referances, referanceCode: $referanceCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferanceStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._referances, _referances) &&
            (identical(other.referanceCode, referanceCode) ||
                other.referanceCode == referanceCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_referances), referanceCode, message);

  /// Create a copy of ReferanceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferanceStateImplCopyWith<_$ReferanceStateImpl> get copyWith =>
      __$$ReferanceStateImplCopyWithImpl<_$ReferanceStateImpl>(
          this, _$identity);
}

abstract class _ReferanceState implements ReferanceState {
  const factory _ReferanceState(
      {required final ReferanceStatus status,
      required final List<ReferralResponseModel> referances,
      required final String referanceCode,
      required final String message}) = _$ReferanceStateImpl;

  @override
  ReferanceStatus get status;
  @override
  List<ReferralResponseModel> get referances;
  @override
  String get referanceCode;
  @override
  String get message;

  /// Create a copy of ReferanceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferanceStateImplCopyWith<_$ReferanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
