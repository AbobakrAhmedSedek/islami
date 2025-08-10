import 'package:flutter/material.dart';
import 'package:islami/style/colorManager.dart';

import '../../../model/onboarding_model.dart';

class OndoardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OndoardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: Image.asset(onboardingModel.imagePath)),
        Text(
          onboardingModel.title,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(color: ColorManager.primary),
          // textAlign: TextAlign.center,
        ),
        onboardingModel.description == null
            ? const SizedBox(height: 16)
            : Text(
              onboardingModel.description!,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: ColorManager.primary),
              textAlign: TextAlign.center,
            ),
        const SizedBox(height: 16),
      ],
    );
  }
}
