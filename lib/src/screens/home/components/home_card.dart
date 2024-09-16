import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.imageSvgPath,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String imageSvgPath;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: color,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: SvgPicture.asset(
                  imageSvgPath,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
