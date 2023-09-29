part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final User user;
  const AuthAuthenticatedState(this.user);
}

class AuthErrorState extends AuthState {
  final String errorMessage;
  const AuthErrorState(this.errorMessage);
}
