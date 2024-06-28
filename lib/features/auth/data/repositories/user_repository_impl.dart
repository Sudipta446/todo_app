import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{

  final SharedPreferences sharedPreferences;
  UserRepositoryImpl(this.sharedPreferences);

  @override
  Future<bool> isSignedIn()async{
    return sharedPreferences.getBool('isSignedIn') ?? false;
  }

}