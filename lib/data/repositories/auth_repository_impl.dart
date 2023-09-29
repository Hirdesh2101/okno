import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:okno/data/models/users.dart';
import 'package:okno/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final auth.UserCredential authResult =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final auth.User? user = authResult.user;
      return user != null ? UserModel.fromFirebaseUser(user) : null;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final auth.UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final auth.User? user = authResult.user;
      return user != null ? UserModel.fromFirebaseUser(user) : null;
    } catch (e) {
      throw e.toString();
    }
  }
}
