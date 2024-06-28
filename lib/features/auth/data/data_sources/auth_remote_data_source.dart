import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/error/server_exceptions.dart';
import 'package:todo_app/core/utils/show_snackbar.dart';
import 'package:todo_app/init_dependecies.dart';

abstract interface class AuthRemoteDataSource{
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password
  });

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  FirebaseAuth auth;
  AuthRemoteDataSourceImpl() : auth = serviceLocator<FirebaseAuth>();

  @override
  Future<User> signInWithEmailAndPassword({required String email, required String password}) async{
    try{
      final userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user == null) {
        throw ServerException('User is null' );
      }

      return user;
    }on FirebaseException catch(e){
      throw ServerException(e.code);
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword({required String email, required String password})async{
    try{
      final userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user == null) {
        throw ServerException('User is null');
      }

      return user;
    }on FirebaseAuthException catch (e){
      throw ServerException(e.code);
    }catch(e){
      throw ServerException(e.toString());
    }
  }
  
}