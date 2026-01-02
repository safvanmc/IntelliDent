import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/validators.dart';
import 'login_event.dart';
import 'login_state.dart';

/// Login BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginFormState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onSubmitted);
  }
  
  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final currentState = state;
    if (currentState is LoginFormState) {
      final emailError = Validators.validateEmail(event.email);
      
      emit(currentState.copyWith(
        email: event.email,
        emailError: emailError,
        isValid: _isFormValid(event.email, currentState.password, emailError, currentState.passwordError),
      ));
    }
  }
  
  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final currentState = state;
    if (currentState is LoginFormState) {
      final passwordError = Validators.validatePassword(event.password);
      
      emit(currentState.copyWith(
        password: event.password,
        passwordError: passwordError,
        isValid: _isFormValid(currentState.email, event.password, currentState.emailError, passwordError),
      ));
    }
  }
  
  void _onPasswordVisibilityToggled(
    LoginPasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) {
    final currentState = state;
    if (currentState is LoginFormState) {
      emit(currentState.copyWith(
        isPasswordVisible: !currentState.isPasswordVisible,
      ));
    }
  }
  
  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final currentState = state;
    if (currentState is LoginFormState) {
      if (!currentState.isValid) {
        return;
      }
      
      emit(currentState.copyWith(isSubmitting: true));
      
      // Simulate API call (local logic only as per requirements)
      await Future.delayed(const Duration(seconds: 1));
      
      // For demo purposes, accept any valid email/password combination
      emit(const LoginSuccess());
    }
  }
  
  bool _isFormValid(
    String email,
    String password,
    String? emailError,
    String? passwordError,
  ) {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        emailError == null &&
        passwordError == null;
  }
}

