import 'package:flutter/material.dart';
import 'package:learnlinked/features/user/presentation/pages/auth/login/blocs/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage()
      },
    );
  }
}