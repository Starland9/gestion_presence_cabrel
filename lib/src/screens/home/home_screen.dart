import 'package:animate_do/animate_do.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';
import 'package:gestion_presence_cabrel/src/screens/home/components/home_card.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FadeInLeftBig(
                child: HomeCard(
                  imageSvgPath: Assets.svgs.employeeIdSvgrepoCom.path,
                  title: 'Employés',
                  color: theme.colorScheme.primary,
                  onTap: () {},
                ),
              ),
            ),
            Expanded(
              child: FadeInRightBig(
                child: HomeCard(
                  imageSvgPath: Assets.svgs.adminWithCogwheelsSvgrepoCom.path,
                  title: 'Administration',
                  color: theme.colorScheme.secondary,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
