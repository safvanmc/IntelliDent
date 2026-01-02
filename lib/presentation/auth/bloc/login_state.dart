import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginFormState extends LoginState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  final bool isPasswordVisible;
  final bool isSubmitting;
  final bool isValid;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.isPasswordVisible = false,
    this.isSubmitting = false,
    this.isValid = false,
  });

  LoginFormState copyWith({
    String? email,
    String? password,
    Object? emailError = _unchanged,
    Object? passwordError = _unchanged,
    bool? isPasswordVisible,
    bool? isSubmitting,
    bool? isValid,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError:
          emailError == _unchanged ? this.emailError : emailError as String?,
      passwordError: passwordError == _unchanged
          ? this.passwordError
          : passwordError as String?,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isValid: isValid ?? this.isValid,
    );
  }

  static const Object _unchanged = Object();

  @override
  List<Object?> get props => [
        email,
        password,
        emailError,
        passwordError,
        isPasswordVisible,
        isSubmitting,
        isValid,
      ];
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
