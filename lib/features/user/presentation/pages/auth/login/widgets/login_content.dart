import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:learnlinked/features/user/presentation/utils/base_color.dart';
import 'package:learnlinked/features/user/presentation/widgets/default_button.dart';
import 'package:learnlinked/features/user/presentation/widgets/default_textfield.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.32,
              color: BASE_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/img/gamepad.png',
                    height: 100,
                    width: 150,
                  ),
                  const Text(
                    'Learn Linked',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, top: 15),
            child: const Text(
              'Continúa con',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: const Text(
              'Login',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 10), // Espacio vertical agregado
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextfield(
              onChanged: (value) {},
              //   vm.changeEmail(value);
              // },
              // error: vm.state.email.error,
              label: 'Correo electrónico',
              icon: Icons.email_outlined,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DefaultTextfield(
              onChanged: (value) {
                // vm.changePassword(value);
              },
              // error: vm.state.password.error,
              obscureTexT: true,
              label: 'Contraseña',
              icon: Icons.lock_outlined,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: DefaultButton(
              onPressed: () {
                // vm.login();
              },
              text: 'Iniciar sesión',
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text(
                '¿No tienes cuenta?',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}