import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "IzaSyBEu_OPJjO1SuRmd0RYpFZlr1muwe0D8uI",
        appId: "1:1001659969527:android:dcfb2553b800e6d70888f2",
        messagingSenderId: "1001659969527",
        projectId: "todoapp-25cfc"),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Color for Android status bar
      statusBarBrightness: Brightness.dark, // Brightness for iOS status bar
      statusBarIconBrightness:
      Brightness.dark, // Icon brightness for both Android and iOS
    ));
    return GetMaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(),
      ),
    );
  }
}

