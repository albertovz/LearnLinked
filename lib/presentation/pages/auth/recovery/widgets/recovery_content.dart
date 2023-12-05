import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';
import 'package:learn_linked/src/presentation/widgets/default_button.dart';
import 'package:learn_linked/src/presentation/widgets/default_textfield.dart';

class RecoveryContent extends StatelessWidget {
  const RecoveryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 50, left: 25),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  ))),
          Container(
            margin: const EdgeInsets.only(left: 25, top: 350),
            child: const Text(
              'Recuperar contraseña',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: LETTER_COLOR),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 25, left: 25),
            child: DefaultTextfield(
                label: 'Correo electrónico',
                icon: Icons.email,
                onChanged: (value) {}),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: DefaultButton(
                text: 'Solicitar contraseña nueva',
                color: BASE_COLOR,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
