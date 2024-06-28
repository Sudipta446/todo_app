import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_palette.dart';

void showSnackBar(BuildContext context, String content){
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(content, style: const TextStyle(color: AppPalette.lightColor, fontWeight: FontWeight.bold),), backgroundColor: AppPalette.errorColor,));
}