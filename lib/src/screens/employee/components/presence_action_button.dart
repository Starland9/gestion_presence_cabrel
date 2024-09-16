import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';

class PresenceActionButton extends StatelessWidget {
  const PresenceActionButton({
    super.key,
    this.onTap,
    required this.text,
    required this.color,
    required this.rotated,
  });

  final VoidCallback? onTap;
  final String text;
  final Color color;
  final bool rotated;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: rotated ? 3.14 / 1 : 0,
            child: Assets.svgs.triangleSvgrepoCom.svg(
              width: 100,
              height: 200,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            text,
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
