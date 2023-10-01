import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:okno/application/screens/authentication/cubit/auth_cubit.dart';
import 'package:okno/application/screens/authentication/view/auth.dart';
import 'package:okno/di_conatiner.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Router Key");

final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/login",
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) {
            return BlocProvider(
              create: (context) => serviceLocator<AuthCubit>(),
              child: const LoginPage(),
            );
          }),
    ]);
