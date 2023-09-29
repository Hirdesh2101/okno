import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:okno/application/screens/authentication/cubit/auth_cubit.dart';
import 'package:okno/application/screens/authentication/view/auth.dart';
import 'package:okno/di_conatiner.dart';
import 'package:okno/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the dependency injection container
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => BlocProvider(
              create: (context) => serviceLocator<AuthCubit>(),
              child: LoginPage(),
            ),
        // '/signup': (context) => BlocProvider(
        //       create: (context) => AuthCubit(AuthUseCasesImpl()),
        //       child: SignupPage(),
        //     ),
      },
    );
  }
}
