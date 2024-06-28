import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/error/server_exceptions.dart';

import '../../../../init_dependecies.dart';
import '../../domain/usecases/check_user_signed_in.dart';
import '../../domain/usecases/user_sign_in.dart';
import '../../domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp userSignUp;
  final UserSignIn userSignIn;
  final CheckUserSignedIn checkUserSignedIn;
  AuthBloc({required this.userSignUp, required this.userSignIn, required this.checkUserSignedIn}) : super(AuthInitialState()){
    on<AuthSignUp>((event, emit)async{
      emit(AuthLoadingState());
      final response = await userSignUp(UserSignUpParams(event.email, event.password));
      response.fold(
              (failure) => emit(AuthErrorState(failure.message)),
              (user) => emit(AuthSuccessState(user, 'signUp'))
      );
    });

    on<AuthSignIn>((event, emit)async{
      emit(AuthLoadingState());
      final response = await userSignIn(UserSignInParams(event.email, event.password));
      response.fold(
              (failure) => emit(AuthErrorState(failure.message)),
              (user) => emit(AuthSuccessState(user, 'signIn'))
      );
    });

    on<AuthCheckSignIn>((event, emit)async{
      final bool isSignedIn = await checkUserSignedIn();

      if (isSignedIn) {
        emit(AuthUserCheckedInSuccessState());
      } else {
        emit(AuthUserCheckedInFailureState());
      }
    });
  }
}

