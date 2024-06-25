import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_palette.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({super.key, required this.hintText, required this.controller, required this.isObscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: AppPalette.buttonColor),
      obscureText: isObscureText,
      cursorColor: AppPalette.lightButtonColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppPalette.lightButtonColor)
      ),
      validator: (value){
        if(value!.isEmpty){
           return "$hintText is needed";
        }else{
          return null;
        }
      },
    );
  }
}
