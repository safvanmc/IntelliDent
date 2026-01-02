import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelli_dent/presentation/auth/bloc/login_bloc.dart';
import 'package:intelli_dent/presentation/dental_tips/bloc/dental_tips_bloc.dart';
import 'package:intelli_dent/presentation/history/bloc/history_bloc.dart';
import 'package:intelli_dent/presentation/home/bloc/home_bloc.dart';
import 'package:intelli_dent/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:intelli_dent/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:intelli_dent/presentation/profile/bloc/profile_bloc.dart';

import 'core/theme/app_theme.dart';
import 'presentation/auth/screens/login_screen.dart';
import 'presentation/navigation/screens/main_navigation_screen.dart';
import 'presentation/onboarding/screens/onboarding_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const IntelliDentApp());
}

/// IntelliDent Dental AI Application
class IntelliDentApp extends StatelessWidget {
  const IntelliDentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => HistoryBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => DentalTipsBloc()),
      ],
      child: MaterialApp(
        title: 'IntelliDent Dental AI',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.onboarding,
        routes: {
          AppRoutes.onboarding: (context) => const OnboardingScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.home: (context) => const MainNavigationScreen(),
        },
      ),
    );
  }
}
