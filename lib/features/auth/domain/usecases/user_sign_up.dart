import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/error.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams>{

  AuthRepository authRepository;
  UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params)async{
    return await authRepository.signUpWithEmailAndPassword(email: params.email, password: params.password);
  }

}

class UserSignUpParams{
  final String email;
  final String password;

  UserSignUpParams(this.email, this.password);
}