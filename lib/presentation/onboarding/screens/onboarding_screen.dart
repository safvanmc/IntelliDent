import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelli_dent/core/widgets/custom_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/onboarding_model.dart';
import '../../../../routes/app_routes.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/onboarding_page.dart';

/// Onboarding screen with PageView and navigation
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pages = OnboardingData.pages;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 200,
                height: mq.height * .25,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  // shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 200,
                height: mq.height * .25,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  // shape: BoxShape.circle,
                ),
              ),
            ),
            BlocConsumer<OnboardingBloc, OnboardingState>(
              listener: (context, state) {
                if (state is OnboardingCompleted) {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.login,
                  );
                }
              },
              builder: (context, state) {
                if (state is OnboardingPageState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.read<OnboardingBloc>().add(
                                      const OnboardingSkip(),
                                    );
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: pages.length,
                          onPageChanged: (index) {
                            context.read<OnboardingBloc>().add(
                                  OnboardingPageChanged(index),
                                );
                          },
                          itemBuilder: (context, index) {
                            return OnboardingPage(
                              pageData: pages[index],
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pages.length,
                          (index) => _buildPageIndicator(
                            context,
                            index == state.currentPage,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!state.isFirstPage)
                              TextButton(
                                onPressed: () {
                                  pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  context.read<OnboardingBloc>().add(
                                        const OnboardingPreviousPage(),
                                      );
                                },
                                child: Text(
                                  'Previous',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.primary,
                                        height: 1.5,
                                      ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                            CustomButton(
                              text: state.isLastPage ? 'Get Started' : 'Next',
                              variant: ButtonVariant.primary,
                              onPressed: () {
                                if (state.isLastPage) {
                                  context.read<OnboardingBloc>().add(
                                        const OnboardingComplete(),
                                      );
                                } else {
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  context.read<OnboardingBloc>().add(
                                        const OnboardingNextPage(),
                                      );
                                }
                              },
                              verticalPadding: 12,
                              horizontalPadding: 16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 24 : 8,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.border,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
