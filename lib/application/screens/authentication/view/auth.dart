import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okno/application/screens/authentication/cubit/auth_cubit.dart';
import 'package:okno/application/screens/authentication/view/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return CircularProgressIndicator();
          } else if (state is AuthAuthenticatedState) {
            return Text('Logged in as ${state.user.uid}');
          } else if (state is AuthErrorState) {
            return Text('Error: ${state.errorMessage}');
          } else {
            return LoginForm(authCubit: authCubit);
          }
        },
      ),
    );
  }
}
