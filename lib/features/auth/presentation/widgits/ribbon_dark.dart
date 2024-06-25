import 'package:flutter/material.dart';

import '../../../../core/theme/app_palette.dart';

class RibbonDark extends StatelessWidget {
  const RibbonDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -90,
        right: 50,
        child: Container(
          width: 80,
          height: 180,
          decoration: BoxDecoration(
            color: AppPalette.buttonColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50)),
          ),
        )
    );
  }
}
