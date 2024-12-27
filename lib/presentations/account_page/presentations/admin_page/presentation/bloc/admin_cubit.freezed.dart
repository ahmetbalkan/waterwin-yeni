// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminState {
  AdminStatus get status => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ReferanceAdminUserInfoModel? get referenceUserInfo =>
      throw _privateConstructorUsedError;
  List<ReferanceAdminModel> get referenceList =>
      throw _privateConstructorUsedError;
  List<ReferanceAdminPaymentModel> get paymentRequests =>
      throw _privateConstructorUsedError;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminStateCopyWith<AdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminStateCopyWith<$Res> {
  factory $AdminStateCopyWith(
          AdminState value, $Res Function(AdminState) then) =
      _$AdminStateCopyWithImpl<$Res, AdminState>;
  @useResult
  $Res call(
      {AdminStatus status,
      bool isLoading,
      String? message,
      ReferanceAdminUserInfoModel? referenceUserInfo,
      List<ReferanceAdminModel> referenceList,
      List<ReferanceAdminPaymentModel> paymentRequests});
}

/// @nodoc
class _$AdminStateCopyWithImpl<$Res, $Val extends AdminState>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isLoading = null,
    Object? message = freezed,
    Object? referenceUserInfo = freezed,
    Object? referenceList = null,
    Object? paymentRequests = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AdminStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUserInfo: freezed == referenceUserInfo
          ? _value.referenceUserInfo
          : referenceUserInfo // ignore: cast_nullable_to_non_nullable
              as ReferanceAdminUserInfoModel?,
      referenceList: null == referenceList
          ? _value.referenceList
          : referenceList // ignore: cast_nullable_to_non_nullable
              as List<ReferanceAdminModel>,
      paymentRequests: null == paymentRequests
          ? _value.paymentRequests
          : paymentRequests // ignore: cast_nullable_to_non_nullable
              as List<ReferanceAdminPaymentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminStateImplCopyWith<$Res>
    implements $AdminStateCopyWith<$Res> {
  factory _$$AdminStateImplCopyWith(
          _$AdminStateImpl value, $Res Function(_$AdminStateImpl) then) =
      __$$AdminStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AdminStatus status,
      bool isLoading,
      String? message,
      ReferanceAdminUserInfoModel? referenceUserInfo,
      List<ReferanceAdminModel> referenceList,
      List<ReferanceAdminPaymentModel> paymentRequests});
}

/// @nodoc
class __$$AdminStateImplCopyWithImpl<$Res>
    extends _$AdminStateCopyWithImpl<$Res, _$AdminStateImpl>
    implements _$$AdminStateImplCopyWith<$Res> {
  __$$AdminStateImplCopyWithImpl(
      _$AdminStateImpl _value, $Res Function(_$AdminStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isLoading = null,
    Object? message = freezed,
    Object? referenceUserInfo = freezed,
    Object? referenceList = null,
    Object? paymentRequests = null,
  }) {
    return _then(_$AdminStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AdminStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceUserInfo: freezed == referenceUserInfo
          ? _value.referenceUserInfo
          : referenceUserInfo // ignore: cast_nullable_to_non_nullable
              as ReferanceAdminUserInfoModel?,
      referenceList: null == referenceList
          ? _value._referenceList
          : referenceList // ignore: cast_nullable_to_non_nullable
              as List<ReferanceAdminModel>,
      paymentRequests: null == paymentRequests
          ? _value._paymentRequests
          : paymentRequests // ignore: cast_nullable_to_non_nullable
              as List<ReferanceAdminPaymentModel>,
    ));
  }
}

/// @nodoc

class _$AdminStateImpl implements _AdminState {
  const _$AdminStateImpl(
      {required this.status,
      required this.isLoading,
      this.message,
      this.referenceUserInfo,
      final List<ReferanceAdminModel> referenceList = const [],
      final List<ReferanceAdminPaymentModel> paymentRequests = const []})
      : _referenceList = referenceList,
        _paymentRequests = paymentRequests;

  @override
  final AdminStatus status;
  @override
  final bool isLoading;
  @override
  final String? message;
  @override
  final ReferanceAdminUserInfoModel? referenceUserInfo;
  final List<ReferanceAdminModel> _referenceList;
  @override
  @JsonKey()
  List<ReferanceAdminModel> get referenceList {
    if (_referenceList is EqualUnmodifiableListView) return _referenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referenceList);
  }

  final List<ReferanceAdminPaymentModel> _paymentRequests;
  @override
  @JsonKey()
  List<ReferanceAdminPaymentModel> get paymentRequests {
    if (_paymentRequests is EqualUnmodifiableListView) return _paymentRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentRequests);
  }

  @override
  String toString() {
    return 'AdminState(status: $status, isLoading: $isLoading, message: $message, referenceUserInfo: $referenceUserInfo, referenceList: $referenceList, paymentRequests: $paymentRequests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.referenceUserInfo, referenceUserInfo) ||
                other.referenceUserInfo == referenceUserInfo) &&
            const DeepCollectionEquality()
                .equals(other._referenceList, _referenceList) &&
            const DeepCollectionEquality()
                .equals(other._paymentRequests, _paymentRequests));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      isLoading,
      message,
      referenceUserInfo,
      const DeepCollectionEquality().hash(_referenceList),
      const DeepCollectionEquality().hash(_paymentRequests));

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      __$$AdminStateImplCopyWithImpl<_$AdminStateImpl>(this, _$identity);
}

abstract class _AdminState implements AdminState {
  const factory _AdminState(
          {required final AdminStatus status,
          required final bool isLoading,
          final String? message,
          final ReferanceAdminUserInfoModel? referenceUserInfo,
          final List<ReferanceAdminModel> referenceList,
          final List<ReferanceAdminPaymentModel> paymentRequests}) =
      _$AdminStateImpl;

  @override
  AdminStatus get status;
  @override
  bool get isLoading;
  @override
  String? get message;
  @override
  ReferanceAdminUserInfoModel? get referenceUserInfo;
  @override
  List<ReferanceAdminModel> get referenceList;
  @override
  List<ReferanceAdminPaymentModel> get paymentRequests;

  /// Create a copy of AdminState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminStateImplCopyWith<_$AdminStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
