import '../style/res/assets_res.dart';

class OnboardingModel {
  final String imagePath;

  final String title;
  final String? description;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnboardingModel> getOnboardingData = [
    OnboardingModel(
      imagePath: AssetsRes.ONBOARDING1,
      title: 'Welcome to Islami',
    ),
    OnboardingModel(
      imagePath: AssetsRes.ONBOARDING2,
      title: 'Daily Prayers',
      description: 'Stay connected with your daily prayers and rituals.',
    ),
    OnboardingModel(
      imagePath: AssetsRes.ONBOARDING3,
      title: 'Quranic Verses',
      description: 'Explore the wisdom of the Quran at your fingertips.',
    ),
    OnboardingModel(
      imagePath: AssetsRes.ONBOARDING4,
      title: 'Islamic Calendar',
      description: 'Keep track of important Islamic dates and events.',
    ),
    OnboardingModel(
      imagePath: AssetsRes.ONBOARDING5,
      title: 'Community & Support',
      description:
          'Join a community of like-minded individuals for support and growth.',
    ),
  ];
}
