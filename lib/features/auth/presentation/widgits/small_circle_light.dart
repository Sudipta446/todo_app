import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class SmallCircleLight extends StatelessWidget {
  const SmallCircleLight({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: -20,
      child: CircleAvatar(
        radius: 85,
        backgroundColor: AppPalette.lightButtonColor.withOpacity(0.1),
      ),
    );
  }
}
