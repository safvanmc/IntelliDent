import 'package:flutter/material.dart';
import 'package:intelli_dent/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/onboarding_model.dart';

/// Reusable onboarding page widget
class OnboardingPage extends StatelessWidget {
  final OnboardingModel pageData;

  const OnboardingPage({
    super.key,
    required this.pageData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Image.asset(
            pageData.icon,
            width: 180,
            height: 180,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AppAssets.loginLogo,
                width: 210,
                height: 210,
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            pageData.title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            pageData.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
