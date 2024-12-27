// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletState {
  WalletRequestStatus get walletRequestStatus =>
      throw _privateConstructorUsedError;
  WalletConfirmationStatus get walletRequestConfirmationStatus =>
      throw _privateConstructorUsedError;
  PaymentInformationStatus get paymentInformationStatus =>
      throw _privateConstructorUsedError;
  String? get walletErrorMessage => throw _privateConstructorUsedError;
  String? get walletConfirmationErrorMessage =>
      throw _privateConstructorUsedError;
  String? get paymentInformationErrorMessage =>
      throw _privateConstructorUsedError;
  PaymentInformationModel? get paymentInformation =>
      throw _privateConstructorUsedError;
  bool get isWalletChangeRequest => throw _privateConstructorUsedError;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletStateCopyWith<WalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
  @useResult
  $Res call(
      {WalletRequestStatus walletRequestStatus,
      WalletConfirmationStatus walletRequestConfirmationStatus,
      PaymentInformationStatus paymentInformationStatus,
      String? walletErrorMessage,
      String? walletConfirmationErrorMessage,
      String? paymentInformationErrorMessage,
      PaymentInformationModel? paymentInformation,
      bool isWalletChangeRequest});
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletRequestStatus = null,
    Object? walletRequestConfirmationStatus = null,
    Object? paymentInformationStatus = null,
    Object? walletErrorMessage = freezed,
    Object? walletConfirmationErrorMessage = freezed,
    Object? paymentInformationErrorMessage = freezed,
    Object? paymentInformation = freezed,
    Object? isWalletChangeRequest = null,
  }) {
    return _then(_value.copyWith(
      walletRequestStatus: null == walletRequestStatus
          ? _value.walletRequestStatus
          : walletRequestStatus // ignore: cast_nullable_to_non_nullable
              as WalletRequestStatus,
      walletRequestConfirmationStatus: null == walletRequestConfirmationStatus
          ? _value.walletRequestConfirmationStatus
          : walletRequestConfirmationStatus // ignore: cast_nullable_to_non_nullable
              as WalletConfirmationStatus,
      paymentInformationStatus: null == paymentInformationStatus
          ? _value.paymentInformationStatus
          : paymentInformationStatus // ignore: cast_nullable_to_non_nullable
              as PaymentInformationStatus,
      walletErrorMessage: freezed == walletErrorMessage
          ? _value.walletErrorMessage
          : walletErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletConfirmationErrorMessage: freezed == walletConfirmationErrorMessage
          ? _value.walletConfirmationErrorMessage
          : walletConfirmationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformationErrorMessage: freezed == paymentInformationErrorMessage
          ? _value.paymentInformationErrorMessage
          : paymentInformationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformation: freezed == paymentInformation
          ? _value.paymentInformation
          : paymentInformation // ignore: cast_nullable_to_non_nullable
              as PaymentInformationModel?,
      isWalletChangeRequest: null == isWalletChangeRequest
          ? _value.isWalletChangeRequest
          : isWalletChangeRequest // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletStateImplCopyWith<$Res>
    implements $WalletStateCopyWith<$Res> {
  factory _$$WalletStateImplCopyWith(
          _$WalletStateImpl value, $Res Function(_$WalletStateImpl) then) =
      __$$WalletStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WalletRequestStatus walletRequestStatus,
      WalletConfirmationStatus walletRequestConfirmationStatus,
      PaymentInformationStatus paymentInformationStatus,
      String? walletErrorMessage,
      String? walletConfirmationErrorMessage,
      String? paymentInformationErrorMessage,
      PaymentInformationModel? paymentInformation,
      bool isWalletChangeRequest});
}

/// @nodoc
class __$$WalletStateImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$WalletStateImpl>
    implements _$$WalletStateImplCopyWith<$Res> {
  __$$WalletStateImplCopyWithImpl(
      _$WalletStateImpl _value, $Res Function(_$WalletStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletRequestStatus = null,
    Object? walletRequestConfirmationStatus = null,
    Object? paymentInformationStatus = null,
    Object? walletErrorMessage = freezed,
    Object? walletConfirmationErrorMessage = freezed,
    Object? paymentInformationErrorMessage = freezed,
    Object? paymentInformation = freezed,
    Object? isWalletChangeRequest = null,
  }) {
    return _then(_$WalletStateImpl(
      walletRequestStatus: null == walletRequestStatus
          ? _value.walletRequestStatus
          : walletRequestStatus // ignore: cast_nullable_to_non_nullable
              as WalletRequestStatus,
      walletRequestConfirmationStatus: null == walletRequestConfirmationStatus
          ? _value.walletRequestConfirmationStatus
          : walletRequestConfirmationStatus // ignore: cast_nullable_to_non_nullable
              as WalletConfirmationStatus,
      paymentInformationStatus: null == paymentInformationStatus
          ? _value.paymentInformationStatus
          : paymentInformationStatus // ignore: cast_nullable_to_non_nullable
              as PaymentInformationStatus,
      walletErrorMessage: freezed == walletErrorMessage
          ? _value.walletErrorMessage
          : walletErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      walletConfirmationErrorMessage: freezed == walletConfirmationErrorMessage
          ? _value.walletConfirmationErrorMessage
          : walletConfirmationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformationErrorMessage: freezed == paymentInformationErrorMessage
          ? _value.paymentInformationErrorMessage
          : paymentInformationErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInformation: freezed == paymentInformation
          ? _value.paymentInformation
          : paymentInformation // ignore: cast_nullable_to_non_nullable
              as PaymentInformationModel?,
      isWalletChangeRequest: null == isWalletChangeRequest
          ? _value.isWalletChangeRequest
          : isWalletChangeRequest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WalletStateImpl implements _WalletState {
  const _$WalletStateImpl(
      {this.walletRequestStatus = WalletRequestStatus.initial,
      this.walletRequestConfirmationStatus = WalletConfirmationStatus.initial,
      this.paymentInformationStatus = PaymentInformationStatus.initial,
      this.walletErrorMessage,
      this.walletConfirmationErrorMessage,
      this.paymentInformationErrorMessage,
      this.paymentInformation,
      this.isWalletChangeRequest = true});

  @override
  @JsonKey()
  final WalletRequestStatus walletRequestStatus;
  @override
  @JsonKey()
  final WalletConfirmationStatus walletRequestConfirmationStatus;
  @override
  @JsonKey()
  final PaymentInformationStatus paymentInformationStatus;
  @override
  final String? walletErrorMessage;
  @override
  final String? walletConfirmationErrorMessage;
  @override
  final String? paymentInformationErrorMessage;
  @override
  final PaymentInformationModel? paymentInformation;
  @override
  @JsonKey()
  final bool isWalletChangeRequest;

  @override
  String toString() {
    return 'WalletState(walletRequestStatus: $walletRequestStatus, walletRequestConfirmationStatus: $walletRequestConfirmationStatus, paymentInformationStatus: $paymentInformationStatus, walletErrorMessage: $walletErrorMessage, walletConfirmationErrorMessage: $walletConfirmationErrorMessage, paymentInformationErrorMessage: $paymentInformationErrorMessage, paymentInformation: $paymentInformation, isWalletChangeRequest: $isWalletChangeRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletStateImpl &&
            (identical(other.walletRequestStatus, walletRequestStatus) ||
                other.walletRequestStatus == walletRequestStatus) &&
            (identical(other.walletRequestConfirmationStatus,
                    walletRequestConfirmationStatus) ||
                other.walletRequestConfirmationStatus ==
                    walletRequestConfirmationStatus) &&
            (identical(
                    other.paymentInformationStatus, paymentInformationStatus) ||
                other.paymentInformationStatus == paymentInformationStatus) &&
            (identical(other.walletErrorMessage, walletErrorMessage) ||
                other.walletErrorMessage == walletErrorMessage) &&
            (identical(other.walletConfirmationErrorMessage,
                    walletConfirmationErrorMessage) ||
                other.walletConfirmationErrorMessage ==
                    walletConfirmationErrorMessage) &&
            (identical(other.paymentInformationErrorMessage,
                    paymentInformationErrorMessage) ||
                other.paymentInformationErrorMessage ==
                    paymentInformationErrorMessage) &&
            (identical(other.paymentInformation, paymentInformation) ||
                other.paymentInformation == paymentInformation) &&
            (identical(other.isWalletChangeRequest, isWalletChangeRequest) ||
                other.isWalletChangeRequest == isWalletChangeRequest));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletRequestStatus,
      walletRequestConfirmationStatus,
      paymentInformationStatus,
      walletErrorMessage,
      walletConfirmationErrorMessage,
      paymentInformationErrorMessage,
      paymentInformation,
      isWalletChangeRequest);

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      __$$WalletStateImplCopyWithImpl<_$WalletStateImpl>(this, _$identity);
}

abstract class _WalletState implements WalletState {
  const factory _WalletState(
      {final WalletRequestStatus walletRequestStatus,
      final WalletConfirmationStatus walletRequestConfirmationStatus,
      final PaymentInformationStatus paymentInformationStatus,
      final String? walletErrorMessage,
      final String? walletConfirmationErrorMessage,
      final String? paymentInformationErrorMessage,
      final PaymentInformationModel? paymentInformation,
      final bool isWalletChangeRequest}) = _$WalletStateImpl;

  @override
  WalletRequestStatus get walletRequestStatus;
  @override
  WalletConfirmationStatus get walletRequestConfirmationStatus;
  @override
  PaymentInformationStatus get paymentInformationStatus;
  @override
  String? get walletErrorMessage;
  @override
  String? get walletConfirmationErrorMessage;
  @override
  String? get paymentInformationErrorMessage;
  @override
  PaymentInformationModel? get paymentInformation;
  @override
  bool get isWalletChangeRequest;

  /// Create a copy of WalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletStateImplCopyWith<_$WalletStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
