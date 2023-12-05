import 'package:flutter/material.dart';
import 'package:learn_linked/injection.dart';
import 'package:learn_linked/main.dart';
import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';
import 'package:learn_linked/src/presentation/pages/auth/login/login_event.dart';
import 'package:learn_linked/src/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginEvent vm = Provider.of<LoginEvent>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.jpg'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            StreamBuilder(
                stream: vm.response,
                builder: (context, snapshot) {
                  final response = snapshot.data;
                  if (response is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (response is Error) {
                    final data = response as Error;
                    Fluttertoast.showToast(
                        msg: 'Error: ${data.error}',
                        toastLength: Toast.LENGTH_LONG);
                  } else if (response is Success) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyApp(locator<AuthUseCases>())),
                          (route) => false);
                    });
                  }
                  return Container();
                }),
            LoginContent(vm)
          ],
        ));
  }
}
