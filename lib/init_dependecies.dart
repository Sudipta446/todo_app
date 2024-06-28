
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/secrets/app_secrets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/user_sign_in.dart';
import 'features/auth/domain/usecases/user_sign_up.dart';
import 'features/auth/presentation/blocs/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {

  final envInit = await dotenv.load(fileName: ".env");

  serviceLocator.registerSingleton(() => envInit);

  final firebaseInit = await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY']!,
        appId: dotenv.env['APP_ID']!,
        messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['PROJECT_ID']!,
    )
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
