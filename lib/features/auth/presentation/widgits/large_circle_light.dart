import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class LargeCircleLight extends StatelessWidget {
  const LargeCircleLight({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -175,
      left: -30,
      child: CircleAvatar(
        radius: 170,
        backgroundColor: AppPalette.lightButtonColor.withOpacity(0.1),
      ),
    );
  }
}
