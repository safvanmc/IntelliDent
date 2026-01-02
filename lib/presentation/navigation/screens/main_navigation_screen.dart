import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../history/screens/history_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';
import '../bloc/navigation_state.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainNavigationView();
  }
}

class _MainNavigationView extends StatelessWidget {
  const _MainNavigationView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final currentIndex =
            state is NavigationInitial ? state.currentIndex : 0;

        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              HomeScreen(),
              HistoryScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(
              8,
              4,
              8,
              8,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // 👈 actual navbar background
                  border: Border.all(
                    color: AppColors.border,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent, // 👈 important
                  elevation: 0,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    context
                        .read<NavigationBloc>()
                        .add(NavigationTabChanged(index));
                  },
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: AppColors.textSecondary,
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  type: BottomNavigationBarType.fixed,

                  iconSize: 20,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.history),
                      label: 'History',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
