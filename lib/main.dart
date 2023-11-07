import 'package:flutter/material.dart';
import 'package:prova_flutter/core/utils/constants.dart';
import 'package:prova_flutter/features/auth/presentation/screens/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:prova_flutter/features/information/screens/information_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio Flutter',
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/auth',
        routes: [
          GoRoute(
            path: '/auth',
            builder: (context, state) => const AuthScreen(),
          ),
          GoRoute(
            path: '/information',
            builder: (context, state) => const InformationScreen(),
          ),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: colorGreen,
              secondary: colorBackgroundGreen,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorGreen,
            foregroundColor: Colors.white,
            fixedSize: const Size(120, 50),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
