import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:okno/application/core/routes/router.dart';
import 'package:okno/application/core/services/theme_service.dart';
import 'package:okno/di_conatiner.dart';
import 'package:okno/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  // Initialize the dependency injection container
  init();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      light: lightTheme,
      dark: darkTheme,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Your App',
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: const [
          ...GlobalCupertinoLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('hi'), // Hindi
        ],
        routerConfig: routes,
      ),
    );
  }
}
