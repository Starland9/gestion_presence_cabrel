import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.eneoCameroonLogo.image(),
          FadeInUp(
            child: Assets.images.prSencesDesEmployS.image(),
          ),
          FilledButton(
            onPressed: () => context.router.replace(const HomeRoute()),
            child: const Text('Commencer'),
          ),
        ],
      ),
    );
  }
}
