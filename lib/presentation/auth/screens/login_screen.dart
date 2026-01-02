import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelli_dent/core/widgets/custom_button.dart';
import 'package:intelli_dent/routes/app_routes.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login successful!'),
                  backgroundColor: AppColors.success,
                ),
              );
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginFormState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset(
                      AppAssets.loginLogo,
                      height: 80,
                      width: 80,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.medical_services,
                          size: 80,
                          color: AppColors.primary,
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to continue to IntelliDent',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    AuthTextField(
                      label: 'Email',
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      errorText: state.emailError,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              LoginEmailChanged(value),
                            );
                      },
                    ),
                    const SizedBox(height: 24),
                    AuthTextField(
                      label: 'Password',
                      hint: 'Enter your password',
                      obscureText: !state.isPasswordVisible,
                      errorText: state.passwordError,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                const LoginPasswordVisibilityToggled(),
                              );
                        },
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              LoginPasswordChanged(value),
                            );
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      variant: ButtonVariant.secondary,
                      onPressed: state.isValid && !state.isSubmitting
                          ? () {
                              context.read<LoginBloc>().add(
                                    const LoginSubmitted(),
                                  );
                            }
                          : null,
                      widget: state.isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : const Text('Login'),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
