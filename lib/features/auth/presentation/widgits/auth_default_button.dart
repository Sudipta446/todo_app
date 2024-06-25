import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_palette.dart';

class AuthDefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AuthDefaultButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppPalette.buttonColor,
          borderRadius: BorderRadius.circular(23)
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: Size(395, 50),
            shadowColor: Colors.transparent
        ),
        child: Text(text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            color: AppPalette.lightColor
          ),
        ),
      ),
    );
  }
}
