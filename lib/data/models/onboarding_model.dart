import '../../../../core/constants/app_assets.dart';

/// Onboarding page data model
class OnboardingModel {
  final String title;
  final String description;
  final String icon;
  
  const OnboardingModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

/// Onboarding data repository
class OnboardingData {
  static List<OnboardingModel> get pages => [
    const OnboardingModel(
      title: 'AI-Powered Diagnostics',
      description: 'Experience cutting-edge AI technology that helps dentists make accurate diagnoses faster and more efficiently.',
      icon: AppAssets.onboardingImage1,
    ),
    const OnboardingModel(
      title: 'Smart Dental Scanning',
      description: 'Advanced scanning technology that captures detailed dental images for comprehensive analysis and treatment planning.',
      icon: AppAssets.onboardingImage2,
    ),
    const OnboardingModel(
      title: 'Get Started Today',
      description: 'Join IntelliDent and revolutionize your dental practice with the power of artificial intelligence.',
      icon: AppAssets.onboardingImage3,
    ),
  ];
}

