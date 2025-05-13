import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled/pages/account_page.dart';
import 'package:untitled/pages/login_page.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://otpsxkjgeowvcshlcomg.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im90cHN4a2pnZW93dmNzaGxjb21nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcxNTM5MzYsImV4cCI6MjA2MjcyOTkzNn0.ZXtDBfc8fNGoscMGpWzXPpu2Yq3het8BQ9bKwV12KL0',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home: supabase.auth.currentSession == null
          ? const LoginPage()
          : const AccountPage(),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}