import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:okno/domain/entities/user.dart';

class UserModel extends User with EquatableMixin {
  final String uid;
  final String email;

  UserModel({
    required this.uid,
    required this.email,
  }) : super(uid: '', email: '');
  factory UserModel.fromFirebaseUser(auth.User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
    );
  }

  @override
  List<Object?> get props => [uid, email];
}
