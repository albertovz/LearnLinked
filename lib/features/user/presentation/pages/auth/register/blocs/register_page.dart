import 'package:flutter/material.dart';
import 'package:learnlinked/features/user/presentation/pages/auth/register/widgets/register_content.dart';
import 'package:learnlinked/features/user/presentation/utils/base_color.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: RegisterContent(),
    );
  }
}