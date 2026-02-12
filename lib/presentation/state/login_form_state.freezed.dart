// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginFormState {
  String? get usernameError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get generalError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of LoginFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginFormStateCopyWith<LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormStateCopyWith<$Res> {
  factory $LoginFormStateCopyWith(
    LoginFormState value,
    $Res Function(LoginFormState) then,
  ) = _$LoginFormStateCopyWithImpl<$Res, LoginFormState>;
  @useResult
  $Res call({
    String? usernameError,
    String? passwordError,
    String? generalError,
    bool isLoading,
  });
}

/// @nodoc
class _$LoginFormStateCopyWithImpl<$Res, $Val extends LoginFormState>
    implements $LoginFormStateCopyWith<$Res> {
  _$LoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameError = freezed,
    Object? passwordError = freezed,
    Object? generalError = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            usernameError: freezed == usernameError
                ? _value.usernameError
                : usernameError // ignore: cast_nullable_to_non_nullable
                      as String?,
            passwordError: freezed == passwordError
                ? _value.passwordError
                : passwordError // ignore: cast_nullable_to_non_nullable
                      as String?,
            generalError: freezed == generalError
                ? _value.generalError
                : generalError // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginFormStateImplCopyWith<$Res>
    implements $LoginFormStateCopyWith<$Res> {
  factory _$$LoginFormStateImplCopyWith(
    _$LoginFormStateImpl value,
    $Res Function(_$LoginFormStateImpl) then,
  ) = __$$LoginFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? usernameError,
    String? passwordError,
    String? generalError,
    bool isLoading,
  });
}

/// @nodoc
class __$$LoginFormStateImplCopyWithImpl<$Res>
    extends _$LoginFormStateCopyWithImpl<$Res, _$LoginFormStateImpl>
    implements _$$LoginFormStateImplCopyWith<$Res> {
  __$$LoginFormStateImplCopyWithImpl(
    _$LoginFormStateImpl _value,
    $Res Function(_$LoginFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameError = freezed,
    Object? passwordError = freezed,
    Object? generalError = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$LoginFormStateImpl(
        usernameError: freezed == usernameError
            ? _value.usernameError
            : usernameError // ignore: cast_nullable_to_non_nullable
                  as String?,
        passwordError: freezed == passwordError
            ? _value.passwordError
            : passwordError // ignore: cast_nullable_to_non_nullable
                  as String?,
        generalError: freezed == generalError
            ? _value.generalError
            : generalError // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LoginFormStateImpl extends _LoginFormState
    with DiagnosticableTreeMixin {
  const _$LoginFormStateImpl({
    this.usernameError,
    this.passwordError,
    this.generalError,
    this.isLoading = false,
  }) : super._();

  @override
  final String? usernameError;
  @override
  final String? passwordError;
  @override
  final String? generalError;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginFormState(usernameError: $usernameError, passwordError: $passwordError, generalError: $generalError, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginFormState'))
      ..add(DiagnosticsProperty('usernameError', usernameError))
      ..add(DiagnosticsProperty('passwordError', passwordError))
      ..add(DiagnosticsProperty('generalError', generalError))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormStateImpl &&
            (identical(other.usernameError, usernameError) ||
                other.usernameError == usernameError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.generalError, generalError) ||
                other.generalError == generalError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    usernameError,
    passwordError,
    generalError,
    isLoading,
  );

  /// Create a copy of LoginFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      __$$LoginFormStateImplCopyWithImpl<_$LoginFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LoginFormState extends LoginFormState {
  const factory _LoginFormState({
    final String? usernameError,
    final String? passwordError,
    final String? generalError,
    final bool isLoading,
  }) = _$LoginFormStateImpl;
  const _LoginFormState._() : super._();

  @override
  String? get usernameError;
  @override
  String? get passwordError;
  @override
  String? get generalError;
  @override
  bool get isLoading;

  /// Create a copy of LoginFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginFormStateImplCopyWith<_$LoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
