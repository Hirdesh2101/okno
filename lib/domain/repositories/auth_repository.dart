import 'package:okno/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> signUpWithEmailAndPassword(String email, String password);
}
