import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class RibbonCircle extends StatelessWidget {
  const RibbonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 40,
      bottom: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppPalette.lightButtonColor.withOpacity(0.1),
      ),
    );
  }
}
