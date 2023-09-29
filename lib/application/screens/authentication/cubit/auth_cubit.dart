import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:okno/domain/entities/user.dart';
import 'package:okno/domain/usecases/auth_usecases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCases _authUseCases;

  AuthCubit(this._authUseCases) : super(AuthInitialState());

  void login(String email, String password) async {
    emit(AuthLoadingState());
    try {
      final user =
          await _authUseCases.signInWithEmailAndPassword(email, password);
      emit(AuthAuthenticatedState(user!));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void logout() {
    _authUseCases.signOut();
    emit(AuthInitialState());
  }
}
