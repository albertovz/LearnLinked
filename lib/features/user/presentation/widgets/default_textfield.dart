import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {
  String label;
  String error;
  IconData icon;
  bool obscureTexT;
  Function(String text) onChanged;

  DefaultTextfield(
      {required this.label,
      required this.icon,
      required this.onChanged,
      this.error = '',
      this.obscureTexT = false
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          errorText: error,
          suffixIcon: Icon(
            icon,
            color: Colors.white,
          )),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureTexT,
    );
  }
}
