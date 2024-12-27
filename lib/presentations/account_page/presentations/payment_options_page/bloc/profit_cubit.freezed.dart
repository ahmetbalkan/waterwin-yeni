// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfitState {
  ProfitDataStatus get dataStatus => throw _privateConstructorUsedError;
  ProfitStatisticsStatus get statisticsStatus =>
      throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  PaymentRequestStatus get paymentRequestStatus =>
      throw _privateConstructorUsedError;
  ProfitDataModel? get profitData => throw _privateConstructorUsedError;
  List<ProfitStatisticModel>? get profitStatistics =>
      throw _privateConstructorUsedError;
  List<PaymentRequestModel>? get paymentRequests =>
      throw _privateConstructorUsedError;
  PaymentInformationModel? get paymentInformation =>
      throw _privateConstructorUsedError;
  bool get isWalletChangeRequest => throw _privateConstructorUsedError;
  String? get dataErrorMessage => throw _privateConstructorUsedError;
  String? get statisticsErrorMessage => throw _privateConstructorUsedError;
  String? get paymentErrorMessage => throw _privateConstructorUsedError;
  String? get walletErrorMessage => throw _privateConstructorUsedError;
  String? get walletConfirmationErrorMessage =>
      throw _privateConstructorUsedError;
  String? get paymentRequestErrorMessage => throw _privateConstructorUsedError;
  String? get paymentInformationErrorMessage =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfitStateCopyWith<ProfitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitStateCopyWith<$Res> {
  factory $ProfitStateCopyWith(
          ProfitState value, $Res Function(ProfitState) then) =
      _$ProfitStateCopyWithImpl<$Res, ProfitState>;
  @useResult
  $Res call(
      {ProfitDataStatus dataStatus,
      ProfitStatisticsStatus statisticsStatus,
      PaymentStatus paymentStatus,
      PaymentRequestStatus paymentRequestStatus,
      ProfitDataModel? profitData,
      List<ProfitStatisticModel>? profitStatistics,
      List<PaymentRequestModel>? paymentRequests,
      PaymentInformationModel? paymentInformation,
      bool isWalletChangeRequest,
      String? dataErrorMessage,
      String? statisticsErrorMessage,
      String? paymentErrorMessage,
      String? walletErrorMessage,
      String? walletConfirmationErrorMessage,
      String? paymentRequestErrorMessage,
      String? paymentInformationErrorMessage});
}

/// @nodoc
class _$ProfitStateCopyWithImpl<$Res, $Val extends ProfitState>
    implements $ProfitStateCopyWith<$Res> {
  _$ProfitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStatus = null,
    Object? statisticsStatus = null,
    Object? paymentStatus = null,
    Object? paymentRequestStatus = null,
    Object? profitData = freezed,
    Object? profitStatistics = freezed,
    Object? paymentRequests = freezed,
    Object? paymentInformation = freezed,
    Object? isWalletChangeRequest = null,
    Object? dataErrorMessage = freezed,
    Object? statisticsErrorMessage = freezed,
    Object? paymentErrorMessage = freezed,
    Object? walletErrorMessage = freezed,
    Object? walletConfirmationErrorMessage = freezed,
    Object? paymentRequestErrorMessage = freezed,
    Object? paymentInformationErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as ProfitDataStatus,
      statisticsStatus: null == statisticsStatus
          ? _value.statisticsStatus
          : statisticsStatus // ignore: cast_nullable_to_non_nullable
              as ProfitStatisticsStatus,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentRequestStatus: null == paymentRequestStatus
          ? _value.paymentRequestStatus
          : paymentRequestStatus // ignore: cast_nullable_to_non_nullable
              as PaymentRequestStatus,
      profitData: freezed == profitData
          ? _value.profitData
          : profitData // ignore: cast_nullable_to_non_nullable
              as ProfitDataModel?,
      profitStatistics: freezed == profitStatistics
          ? _value.profitStatistics
          : profitStatistics // ignore: cast_nullable_to_non_nullable
              as List<ProfitStatisticModel>?,
      paymentRequests: freezed == paymentRequests
          ? _value.paymentRequests
          : paymentRequests // ignore: cast_nullable_to_non_nullable
              as List<PaymentRequestModel>?,
      paymentInformation: freezed == paymentInformation
          ? _value.paymentInformation
          : paymentInformation // ignore: cast_nullable_to_non_nullable
              as PaymentInformationModel?,
      isWalletChangeRequest: null == isWalletChangeRequest
          ? _value.isWalletChangeRequest
          : isWalletChangeRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      dataErrorMessage: freezed == dataErrorMessage
          ? _value.dataErrorMessage
          : dataErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      statisticsErrorMessage: freezed == statisticsErrorMessage
          ? _value.statisticsErrorMessage
          : statisticsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentErrorMessage: freezed == paymentErrorMessage
          ? _value.paymentErrorMessage
          : paymentErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletErrorMessage: freezed == walletErrorMessage
          ? _value.walletErrorMessage
          : walletErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletConfirmationErrorMessage: freezed == walletConfirmationErrorMessage
          ? _value.walletConfirmationErrorMessage
          : walletConfirmationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequestErrorMessage: freezed == paymentRequestErrorMessage
          ? _value.paymentRequestErrorMessage
          : paymentRequestErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformationErrorMessage: freezed == paymentInformationErrorMessage
          ? _value.paymentInformationErrorMessage
          : paymentInformationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitStateImplCopyWith<$Res>
    implements $ProfitStateCopyWith<$Res> {
  factory _$$ProfitStateImplCopyWith(
          _$ProfitStateImpl value, $Res Function(_$ProfitStateImpl) then) =
      __$$ProfitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfitDataStatus dataStatus,
      ProfitStatisticsStatus statisticsStatus,
      PaymentStatus paymentStatus,
      PaymentRequestStatus paymentRequestStatus,
      ProfitDataModel? profitData,
      List<ProfitStatisticModel>? profitStatistics,
      List<PaymentRequestModel>? paymentRequests,
      PaymentInformationModel? paymentInformation,
      bool isWalletChangeRequest,
      String? dataErrorMessage,
      String? statisticsErrorMessage,
      String? paymentErrorMessage,
      String? walletErrorMessage,
      String? walletConfirmationErrorMessage,
      String? paymentRequestErrorMessage,
      String? paymentInformationErrorMessage});
}

/// @nodoc
class __$$ProfitStateImplCopyWithImpl<$Res>
    extends _$ProfitStateCopyWithImpl<$Res, _$ProfitStateImpl>
    implements _$$ProfitStateImplCopyWith<$Res> {
  __$$ProfitStateImplCopyWithImpl(
      _$ProfitStateImpl _value, $Res Function(_$ProfitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataStatus = null,
    Object? statisticsStatus = null,
    Object? paymentStatus = null,
    Object? paymentRequestStatus = null,
    Object? profitData = freezed,
    Object? profitStatistics = freezed,
    Object? paymentRequests = freezed,
    Object? paymentInformation = freezed,
    Object? isWalletChangeRequest = null,
    Object? dataErrorMessage = freezed,
    Object? statisticsErrorMessage = freezed,
    Object? paymentErrorMessage = freezed,
    Object? walletErrorMessage = freezed,
    Object? walletConfirmationErrorMessage = freezed,
    Object? paymentRequestErrorMessage = freezed,
    Object? paymentInformationErrorMessage = freezed,
  }) {
    return _then(_$ProfitStateImpl(
      dataStatus: null == dataStatus
          ? _value.dataStatus
          : dataStatus // ignore: cast_nullable_to_non_nullable
              as ProfitDataStatus,
      statisticsStatus: null == statisticsStatus
          ? _value.statisticsStatus
          : statisticsStatus // ignore: cast_nullable_to_non_nullable
              as ProfitStatisticsStatus,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentRequestStatus: null == paymentRequestStatus
          ? _value.paymentRequestStatus
          : paymentRequestStatus // ignore: cast_nullable_to_non_nullable
              as PaymentRequestStatus,
      profitData: freezed == profitData
          ? _value.profitData
          : profitData // ignore: cast_nullable_to_non_nullable
              as ProfitDataModel?,
      profitStatistics: freezed == profitStatistics
          ? _value._profitStatistics
          : profitStatistics // ignore: cast_nullable_to_non_nullable
              as List<ProfitStatisticModel>?,
      paymentRequests: freezed == paymentRequests
          ? _value._paymentRequests
          : paymentRequests // ignore: cast_nullable_to_non_nullable
              as List<PaymentRequestModel>?,
      paymentInformation: freezed == paymentInformation
          ? _value.paymentInformation
          : paymentInformation // ignore: cast_nullable_to_non_nullable
              as PaymentInformationModel?,
      isWalletChangeRequest: null == isWalletChangeRequest
          ? _value.isWalletChangeRequest
          : isWalletChangeRequest // ignore: cast_nullable_to_non_nullable
              as bool,
      dataErrorMessage: freezed == dataErrorMessage
          ? _value.dataErrorMessage
          : dataErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      statisticsErrorMessage: freezed == statisticsErrorMessage
          ? _value.statisticsErrorMessage
          : statisticsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentErrorMessage: freezed == paymentErrorMessage
          ? _value.paymentErrorMessage
          : paymentErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletErrorMessage: freezed == walletErrorMessage
          ? _value.walletErrorMessage
          : walletErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletConfirmationErrorMessage: freezed == walletConfirmationErrorMessage
          ? _value.walletConfirmationErrorMessage
          : walletConfirmationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRequestErrorMessage: freezed == paymentRequestErrorMessage
          ? _value.paymentRequestErrorMessage
          : paymentRequestErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformationErrorMessage: freezed == paymentInformationErrorMessage
          ? _value.paymentInformationErrorMessage
          : paymentInformationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfitStateImpl implements _ProfitState {
  const _$ProfitStateImpl(
      {this.dataStatus = ProfitDataStatus.initial,
      this.statisticsStatus = ProfitStatisticsStatus.initial,
      this.paymentStatus = PaymentStatus.initial,
      this.paymentRequestStatus = PaymentRequestStatus.initial,
      this.profitData,
      final List<ProfitStatisticModel>? profitStatistics,
      final List<PaymentRequestModel>? paymentRequests,
      this.paymentInformation,
      this.isWalletChangeRequest = true,
      this.dataErrorMessage,
      this.statisticsErrorMessage,
      this.paymentErrorMessage,
      this.walletErrorMessage,
      this.walletConfirmationErrorMessage,
      this.paymentRequestErrorMessage,
      this.paymentInformationErrorMessage})
      : _profitStatistics = profitStatistics,
        _paymentRequests = paymentRequests;

  @override
  @JsonKey()
  final ProfitDataStatus dataStatus;
  @override
  @JsonKey()
  final ProfitStatisticsStatus statisticsStatus;
  @override
  @JsonKey()
  final PaymentStatus paymentStatus;
  @override
  @JsonKey()
  final PaymentRequestStatus paymentRequestStatus;
  @override
  final ProfitDataModel? profitData;
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

  final List<PaymentRequestModel>? _paymentRequests;
  @override
  List<PaymentRequestModel>? get paymentRequests {
    final value = _paymentRequests;
    if (value == null) return null;
    if (_paymentRequests is EqualUnmodifiableListView) return _paymentRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaymentInformationModel? paymentInformation;
  @override
  @JsonKey()
  final bool isWalletChangeRequest;
  @override
  final String? dataErrorMessage;
  @override
  final String? statisticsErrorMessage;
  @override
  final String? paymentErrorMessage;
  @override
  final String? walletErrorMessage;
  @override
  final String? walletConfirmationErrorMessage;
  @override
  final String? paymentRequestErrorMessage;
  @override
  final String? paymentInformationErrorMessage;

  @override
  String toString() {
    return 'ProfitState(dataStatus: $dataStatus, statisticsStatus: $statisticsStatus, paymentStatus: $paymentStatus, paymentRequestStatus: $paymentRequestStatus, profitData: $profitData, profitStatistics: $profitStatistics, paymentRequests: $paymentRequests, paymentInformation: $paymentInformation, isWalletChangeRequest: $isWalletChangeRequest, dataErrorMessage: $dataErrorMessage, statisticsErrorMessage: $statisticsErrorMessage, paymentErrorMessage: $paymentErrorMessage, walletErrorMessage: $walletErrorMessage, walletConfirmationErrorMessage: $walletConfirmationErrorMessage, paymentRequestErrorMessage: $paymentRequestErrorMessage, paymentInformationErrorMessage: $paymentInformationErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitStateImpl &&
            (identical(other.dataStatus, dataStatus) ||
                other.dataStatus == dataStatus) &&
            (identical(other.statisticsStatus, statisticsStatus) ||
                other.statisticsStatus == statisticsStatus) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentRequestStatus, paymentRequestStatus) ||
                other.paymentRequestStatus == paymentRequestStatus) &&
            (identical(other.profitData, profitData) ||
                other.profitData == profitData) &&
            const DeepCollectionEquality()
                .equals(other._profitStatistics, _profitStatistics) &&
            const DeepCollectionEquality()
                .equals(other._paymentRequests, _paymentRequests) &&
            (identical(other.paymentInformation, paymentInformation) ||
                other.paymentInformation == paymentInformation) &&
            (identical(other.isWalletChangeRequest, isWalletChangeRequest) ||
                other.isWalletChangeRequest == isWalletChangeRequest) &&
            (identical(other.dataErrorMessage, dataErrorMessage) ||
                other.dataErrorMessage == dataErrorMessage) &&
            (identical(other.statisticsErrorMessage, statisticsErrorMessage) ||
                other.statisticsErrorMessage == statisticsErrorMessage) &&
            (identical(other.paymentErrorMessage, paymentErrorMessage) ||
                other.paymentErrorMessage == paymentErrorMessage) &&
            (identical(other.walletErrorMessage, walletErrorMessage) ||
                other.walletErrorMessage == walletErrorMessage) &&
            (identical(other.walletConfirmationErrorMessage,
                    walletConfirmationErrorMessage) ||
                other.walletConfirmationErrorMessage ==
                    walletConfirmationErrorMessage) &&
            (identical(other.paymentRequestErrorMessage,
                    paymentRequestErrorMessage) ||
                other.paymentRequestErrorMessage ==
                    paymentRequestErrorMessage) &&
            (identical(other.paymentInformationErrorMessage,
                    paymentInformationErrorMessage) ||
                other.paymentInformationErrorMessage ==
                    paymentInformationErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataStatus,
      statisticsStatus,
      paymentStatus,
      paymentRequestStatus,
      profitData,
      const DeepCollectionEquality().hash(_profitStatistics),
      const DeepCollectionEquality().hash(_paymentRequests),
      paymentInformation,
      isWalletChangeRequest,
      dataErrorMessage,
      statisticsErrorMessage,
      paymentErrorMessage,
      walletErrorMessage,
      walletConfirmationErrorMessage,
      paymentRequestErrorMessage,
      paymentInformationErrorMessage);

  /// Create a copy of ProfitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitStateImplCopyWith<_$ProfitStateImpl> get copyWith =>
      __$$ProfitStateImplCopyWithImpl<_$ProfitStateImpl>(this, _$identity);
}

abstract class _ProfitState implements ProfitState {
  const factory _ProfitState(
      {final ProfitDataStatus dataStatus,
      final ProfitStatisticsStatus statisticsStatus,
      final PaymentStatus paymentStatus,
      final PaymentRequestStatus paymentRequestStatus,
      final ProfitDataModel? profitData,
      final List<ProfitStatisticModel>? profitStatistics,
      final List<PaymentRequestModel>? paymentRequests,
      final PaymentInformationModel? paymentInformation,
      final bool isWalletChangeRequest,
      final String? dataErrorMessage,
      final String? statisticsErrorMessage,
      final String? paymentErrorMessage,
      final String? walletErrorMessage,
      final String? walletConfirmationErrorMessage,
      final String? paymentRequestErrorMessage,
      final String? paymentInformationErrorMessage}) = _$ProfitStateImpl;

  @override
  ProfitDataStatus get dataStatus;
  @override
  ProfitStatisticsStatus get statisticsStatus;
  @override
  PaymentStatus get paymentStatus;
  @override
  PaymentRequestStatus get paymentRequestStatus;
  @override
  ProfitDataModel? get profitData;
  @override
  List<ProfitStatisticModel>? get profitStatistics;
  @override
  List<PaymentRequestModel>? get paymentRequests;
  @override
  PaymentInformationModel? get paymentInformation;
  @override
  bool get isWalletChangeRequest;
  @override
  String? get dataErrorMessage;
  @override
  String? get statisticsErrorMessage;
  @override
  String? get paymentErrorMessage;
  @override
  String? get walletErrorMessage;
  @override
  String? get walletConfirmationErrorMessage;
  @override
  String? get paymentRequestErrorMessage;
  @override
  String? get paymentInformationErrorMessage;

  /// Create a copy of ProfitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfitStateImplCopyWith<_$ProfitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
