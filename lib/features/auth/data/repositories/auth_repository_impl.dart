import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/server_exceptions.dart';
import 'package:todo_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/error.dart';

class AuthRepositoryImpl implements AuthRepository{

  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({required String email, required String password})async{
    try{
      final user = await authRemoteDataSource.signInWithEmailAndPassword(email: email, password: password);

      return right(user);
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({required String email, required String password})async{
    try{
      final user = await authRemoteDataSource.signUpWithEmailAndPassword(email: email, password: password);
      return right(user);
    }on ServerException catch(e){
      return left(Failure(e.toString()));
    }
  }

}