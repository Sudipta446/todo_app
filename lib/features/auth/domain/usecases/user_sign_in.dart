import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/error.dart';
import 'package:todo_app/core/usecases/usecase.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:todo_app/features/auth/domain/usecases/user_sign_up.dart';

class UserSignIn implements UseCase<User, UserSignInParams>{

  AuthRepository authRepository;
  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParams params)async{
    return await authRepository.signInWithEmailAndPassword(email: params.email, password: params.password);
  }

}

class UserSignInParams{
  final String email;
  final String password;

  UserSignInParams(this.email, this.password);
}