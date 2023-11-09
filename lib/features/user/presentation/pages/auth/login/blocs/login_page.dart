import 'package:flutter/material.dart';
import 'package:learnlinked/features/user/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:learnlinked/features/user/presentation/utils/base_color.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: LoginContent()
    );
  }
}