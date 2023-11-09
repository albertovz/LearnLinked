import 'package:flutter/material.dart';
import 'package:learnlinked/features/user/presentation/pages/auth/login/blocs/login_page.dart';
import 'package:learnlinked/features/user/presentation/pages/auth/register/blocs/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => const RegisterPage()
      },
    );
  }
}