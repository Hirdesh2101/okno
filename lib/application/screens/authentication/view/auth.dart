import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okno/application/screens/authentication/cubit/auth_cubit.dart';
import 'package:okno/application/screens/authentication/view/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) => BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return const LoginForm();
                  },
                ),
              ),
              Breakpoints.large: SlotLayout.from(
                key: const Key('Body Medium'),
                builder: (_) => Container(
                  color: const Color.fromARGB(255, 234, 158, 192),
                ),
              )
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.large: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) => BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return const LoginForm();
                  },
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
