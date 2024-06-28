import '../repositories/user_repository.dart';

class CheckUserSignedIn {
  final UserRepository repository;

  CheckUserSignedIn(this.repository);

  Future<bool> call() {
    return repository.isSignedIn();
  }
}