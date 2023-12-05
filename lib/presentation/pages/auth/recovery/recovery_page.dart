import 'package:flutter/material.dart';
import 'package:learn_linked/injection.dart';
import 'package:learn_linked/main.dart';
import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';
import 'package:learn_linked/src/presentation/pages/auth/login/login_event.dart';
import 'package:learn_linked/src/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:learn_linked/src/presentation/pages/auth/recovery/widgets/recovery_content.dart';
import 'package:learn_linked/src/presentation/pages/posts/create/widgets/posts_create_content.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginEvent vm = Provider.of<LoginEvent>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/img/logo.jpg'), // Change this to your image path
                ),
              ),
            ),
            RecoveryContent()
          ],
        ));
  }
}
