
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/secrets/app_secrets.dart';

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/user_sign_in.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {

  final firebaseInit = await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: AppSecrets.apiKey,
        appId: AppSecrets.appId,
        messagingSenderId: AppSecrets.messagingSenderId,
        projectId: AppSecrets.projectId),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final auth = FirebaseAuth.instance;


  serviceLocator.registerLazySingleton(() => firebaseInit);
  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);
  serviceLocator.registerSingleton<FirebaseAuth>(auth);

}

/**void _initAuth(){
  serviceLocator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator(), userSignIn: serviceLocator()));
}**/
