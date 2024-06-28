import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/theme/app_palette.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:todo_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:todo_app/features/auth/data/repositories/user_repository_impl.dart';
import 'package:todo_app/features/auth/domain/repositories/user_repository.dart';
import 'package:todo_app/features/auth/domain/usecases/check_user_signed_in.dart';
import 'package:todo_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:todo_app/features/auth/presentation/pages/signin_page.dart';

import 'features/auth/domain/usecases/user_sign_in.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'init_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthBloc(
              userSignUp:
                  UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
              userSignIn:
                  UserSignIn(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
              checkUserSignedIn: CheckUserSignedIn(
                  UserRepositoryImpl(serviceLocator<SharedPreferences>()))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();

    authBloc = AuthBloc(
        userSignUp:
        UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
        userSignIn:
        UserSignIn(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
        checkUserSignedIn: CheckUserSignedIn(
            UserRepositoryImpl(serviceLocator<SharedPreferences>())))..add(AuthCheckSignIn());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Color for Android status bar
      statusBarBrightness: Brightness.dark, // Brightness for iOS status bar
      statusBarIconBrightness:
          Brightness.dark, // Icon brightness for both Android and iOS
    ));

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is AuthLoadingState){
          return GetMaterialApp(
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: AppPalette.blackColor,
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppPalette.lightColor,
                  ),
                ),
              ));
        }
        if(state is AuthUserCheckedInSuccessState){
          return GetMaterialApp(
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              home: const HomePage());
        }else{
          return GetMaterialApp(
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              home: const SignInPage());
        }
      },
    );
  }
}
