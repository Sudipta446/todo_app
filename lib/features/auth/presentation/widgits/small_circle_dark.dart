import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class SmallCircleDark extends StatelessWidget {
  const SmallCircleDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -80,
      right: -20,
      child: CircleAvatar(
        radius: 85,
        backgroundColor: AppPalette.buttonColor.withOpacity(0.8),
      ),
    );
  }
}
