// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final RequestState? loginState;
  @override
  final String? loginMessage;
  @override
  final LoginModel? loginModel;
  @override
  final RequestState? registerState;
  @override
  final String? registerMessage;
  @override
  final RegisterModel? registerModel;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {this.loginState,
      this.loginMessage,
      this.loginModel,
      this.registerState,
      this.registerMessage,
      this.registerModel})
      : super._();

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        loginState == other.loginState &&
        loginMessage == other.loginMessage &&
        loginModel == other.loginModel &&
        registerState == other.registerState &&
        registerMessage == other.registerMessage &&
        registerModel == other.registerModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, loginState.hashCode);
    _$hash = $jc(_$hash, loginMessage.hashCode);
    _$hash = $jc(_$hash, loginModel.hashCode);
    _$hash = $jc(_$hash, registerState.hashCode);
    _$hash = $jc(_$hash, registerMessage.hashCode);
    _$hash = $jc(_$hash, registerModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthState')
          ..add('loginState', loginState)
          ..add('loginMessage', loginMessage)
          ..add('loginModel', loginModel)
          ..add('registerState', registerState)
          ..add('registerMessage', registerMessage)
          ..add('registerModel', registerModel))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  RequestState? _loginState;
  RequestState? get loginState => _$this._loginState;
  set loginState(RequestState? loginState) => _$this._loginState = loginState;

  String? _loginMessage;
  String? get loginMessage => _$this._loginMessage;
  set loginMessage(String? loginMessage) => _$this._loginMessage = loginMessage;

  LoginModel? _loginModel;
  LoginModel? get loginModel => _$this._loginModel;
  set loginModel(LoginModel? loginModel) => _$this._loginModel = loginModel;

  RequestState? _registerState;
  RequestState? get registerState => _$this._registerState;
  set registerState(RequestState? registerState) =>
      _$this._registerState = registerState;

  String? _registerMessage;
  String? get registerMessage => _$this._registerMessage;
  set registerMessage(String? registerMessage) =>
      _$this._registerMessage = registerMessage;

  RegisterModel? _registerModel;
  RegisterModel? get registerModel => _$this._registerModel;
  set registerModel(RegisterModel? registerModel) =>
      _$this._registerModel = registerModel;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loginState = $v.loginState;
      _loginMessage = $v.loginMessage;
      _loginModel = $v.loginModel;
      _registerState = $v.registerState;
      _registerMessage = $v.registerMessage;
      _registerModel = $v.registerModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    final _$result = _$v ??
        new _$AuthState._(
            loginState: loginState,
            loginMessage: loginMessage,
            loginModel: loginModel,
            registerState: registerState,
            registerMessage: registerMessage,
            registerModel: registerModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
