
import 'package:built_value/built_value.dart';

import '../../../core/enum/enums.dart';
import '../login/models/login_model.dart';
import '../login/models/user_model.dart';
import '../register/models/register_model.dart';


part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  RequestState? get loginState;

  String? get loginMessage;

  LoginModel? get loginModel;

  RequestState? get registerState;

  String? get registerMessage;

  RegisterModel? get registerModel;

  AuthState._();

  factory AuthState([void Function(AuthStateBuilder) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState((b) =>
    b
      ..loginState = RequestState.nothing
      ..loginMessage = ''
      ..loginModel = LoginModel(
        token: ""
      )

      ..registerState = RequestState.nothing
      ..registerMessage = ''
      ..registerModel = RegisterModel(
        type: '',
        user: User(
          id: 0,
          firstName: '',
          lastName: '',
          description: '',
          profilePicture: '',
          email: '',
          emailVerifiedAt: '',
          contactNumber: '',
          role: '',
          status: '0',
          balance: '',
          verificationCode: '',
          mblConfirmationCode: '',
          createdAt: '',
          updatedAt: '',
          averageRating: '',
          orderNumbers: null,
        ),
        accessToken: '', message: '',)
    );
  }
}
