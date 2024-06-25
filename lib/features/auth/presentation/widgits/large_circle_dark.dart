import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class LargeCircleDark extends StatelessWidget {
  const LargeCircleDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -185,
      left: -30,
      child: CircleAvatar(
        radius: 170,
        backgroundColor: AppPalette.buttonColor,
      ),
    );
  }
}
