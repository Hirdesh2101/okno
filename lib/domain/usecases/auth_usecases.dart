import 'package:okno/domain/entities/user.dart';
import 'package:okno/domain/repositories/auth_repository.dart';

class AuthUseCases {
  final AuthRepository _authRepository;

  AuthUseCases(this._authRepository);

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    return _authRepository.signInWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    return _authRepository.signOut();
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    return _authRepository.signUpWithEmailAndPassword(email, password);
  }
}
