// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink_reminder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DrinkReminderState {
  DrinkReminderStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get isReminderOn => throw _privateConstructorUsedError;
  String get reminderMessage => throw _privateConstructorUsedError;
  int get reminderInterval => throw _privateConstructorUsedError;
  TimeOfDay get dayStart => throw _privateConstructorUsedError;
  TimeOfDay get dayEnd => throw _privateConstructorUsedError;

  /// Create a copy of DrinkReminderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrinkReminderStateCopyWith<DrinkReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrinkReminderStateCopyWith<$Res> {
  factory $DrinkReminderStateCopyWith(
          DrinkReminderState value, $Res Function(DrinkReminderState) then) =
      _$DrinkReminderStateCopyWithImpl<$Res, DrinkReminderState>;
  @useResult
  $Res call(
      {DrinkReminderStatus status,
      String errorMessage,
      int isReminderOn,
      String reminderMessage,
      int reminderInterval,
      TimeOfDay dayStart,
      TimeOfDay dayEnd});
}

/// @nodoc
class _$DrinkReminderStateCopyWithImpl<$Res, $Val extends DrinkReminderState>
    implements $DrinkReminderStateCopyWith<$Res> {
  _$DrinkReminderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrinkReminderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? isReminderOn = null,
    Object? reminderMessage = null,
    Object? reminderInterval = null,
    Object? dayStart = null,
    Object? dayEnd = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DrinkReminderStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isReminderOn: null == isReminderOn
          ? _value.isReminderOn
          : isReminderOn // ignore: cast_nullable_to_non_nullable
              as int,
      reminderMessage: null == reminderMessage
          ? _value.reminderMessage
          : reminderMessage // ignore: cast_nullable_to_non_nullable
              as String,
      reminderInterval: null == reminderInterval
          ? _value.reminderInterval
          : reminderInterval // ignore: cast_nullable_to_non_nullable
              as int,
      dayStart: null == dayStart
          ? _value.dayStart
          : dayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayEnd: null == dayEnd
          ? _value.dayEnd
          : dayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrinkReminderStateImplCopyWith<$Res>
    implements $DrinkReminderStateCopyWith<$Res> {
  factory _$$DrinkReminderStateImplCopyWith(_$DrinkReminderStateImpl value,
          $Res Function(_$DrinkReminderStateImpl) then) =
      __$$DrinkReminderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DrinkReminderStatus status,
      String errorMessage,
      int isReminderOn,
      String reminderMessage,
      int reminderInterval,
      TimeOfDay dayStart,
      TimeOfDay dayEnd});
}

/// @nodoc
class __$$DrinkReminderStateImplCopyWithImpl<$Res>
    extends _$DrinkReminderStateCopyWithImpl<$Res, _$DrinkReminderStateImpl>
    implements _$$DrinkReminderStateImplCopyWith<$Res> {
  __$$DrinkReminderStateImplCopyWithImpl(_$DrinkReminderStateImpl _value,
      $Res Function(_$DrinkReminderStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrinkReminderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = null,
    Object? isReminderOn = null,
    Object? reminderMessage = null,
    Object? reminderInterval = null,
    Object? dayStart = null,
    Object? dayEnd = null,
  }) {
    return _then(_$DrinkReminderStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DrinkReminderStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isReminderOn: null == isReminderOn
          ? _value.isReminderOn
          : isReminderOn // ignore: cast_nullable_to_non_nullable
              as int,
      reminderMessage: null == reminderMessage
          ? _value.reminderMessage
          : reminderMessage // ignore: cast_nullable_to_non_nullable
              as String,
      reminderInterval: null == reminderInterval
          ? _value.reminderInterval
          : reminderInterval // ignore: cast_nullable_to_non_nullable
              as int,
      dayStart: null == dayStart
          ? _value.dayStart
          : dayStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      dayEnd: null == dayEnd
          ? _value.dayEnd
          : dayEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$DrinkReminderStateImpl implements _DrinkReminderState {
  const _$DrinkReminderStateImpl(
      {required this.status,
      required this.errorMessage,
      required this.isReminderOn,
      required this.reminderMessage,
      required this.reminderInterval,
      required this.dayStart,
      required this.dayEnd});

  @override
  final DrinkReminderStatus status;
  @override
  final String errorMessage;
  @override
  final int isReminderOn;
  @override
  final String reminderMessage;
  @override
  final int reminderInterval;
  @override
  final TimeOfDay dayStart;
  @override
  final TimeOfDay dayEnd;

  @override
  String toString() {
    return 'DrinkReminderState(status: $status, errorMessage: $errorMessage, isReminderOn: $isReminderOn, reminderMessage: $reminderMessage, reminderInterval: $reminderInterval, dayStart: $dayStart, dayEnd: $dayEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrinkReminderStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isReminderOn, isReminderOn) ||
                other.isReminderOn == isReminderOn) &&
            (identical(other.reminderMessage, reminderMessage) ||
                other.reminderMessage == reminderMessage) &&
            (identical(other.reminderInterval, reminderInterval) ||
                other.reminderInterval == reminderInterval) &&
            (identical(other.dayStart, dayStart) ||
                other.dayStart == dayStart) &&
            (identical(other.dayEnd, dayEnd) || other.dayEnd == dayEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage,
      isReminderOn, reminderMessage, reminderInterval, dayStart, dayEnd);

  /// Create a copy of DrinkReminderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrinkReminderStateImplCopyWith<_$DrinkReminderStateImpl> get copyWith =>
      __$$DrinkReminderStateImplCopyWithImpl<_$DrinkReminderStateImpl>(
          this, _$identity);
}

abstract class _DrinkReminderState implements DrinkReminderState {
  const factory _DrinkReminderState(
      {required final DrinkReminderStatus status,
      required final String errorMessage,
      required final int isReminderOn,
      required final String reminderMessage,
      required final int reminderInterval,
      required final TimeOfDay dayStart,
      required final TimeOfDay dayEnd}) = _$DrinkReminderStateImpl;

  @override
  DrinkReminderStatus get status;
  @override
  String get errorMessage;
  @override
  int get isReminderOn;
  @override
  String get reminderMessage;
  @override
  int get reminderInterval;
  @override
  TimeOfDay get dayStart;
  @override
  TimeOfDay get dayEnd;

  /// Create a copy of DrinkReminderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrinkReminderStateImplCopyWith<_$DrinkReminderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
