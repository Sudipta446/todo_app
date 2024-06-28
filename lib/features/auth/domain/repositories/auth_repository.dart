
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';

abstract interface class AuthRepository{
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password
  });

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password
  });
}