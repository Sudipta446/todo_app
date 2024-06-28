part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState{}

class AuthErrorState extends AuthState{
  final String message;
  AuthErrorState(this.message);
}

class AuthSuccessState extends AuthState{
  final User user;
  final String authType;
  final SharedPreferences prefs;
  AuthSuccessState(this.user, this.authType) : prefs = serviceLocator<SharedPreferences>() {
    try{
      _saveUserDetails(authType, user.uid, user.email!);
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  Future<void> _saveUserDetails(String authType, String id, String email) async {
    if(authType == 'signIn'){
      await prefs.setBool('isSignedIn', true);
    }else{
      await prefs.setBool('isSignedIn', false);
    }

    await prefs.setString('userId', id);
    await prefs.setString('userEmail', email);
  }
}

class AuthUserCheckedInSuccessState extends AuthState{}

class AuthUserCheckedInFailureState extends AuthState{}
