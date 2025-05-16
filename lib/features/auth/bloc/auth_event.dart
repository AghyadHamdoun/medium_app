import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String contactNumber;
  final String role;

  const RegisterEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.contactNumber,
      required this.role});
  }
