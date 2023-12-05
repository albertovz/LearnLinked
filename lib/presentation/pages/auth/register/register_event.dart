import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:learn_linked/src/domain/use_cases/institutions/institutions_usecases.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';
import 'package:learn_linked/src/presentation/pages/auth/register/register_state.dart';
import 'package:learn_linked/src/presentation/utils/validation_item.dart';

class RegisterEvent extends ChangeNotifier {
  // ESATADO
  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  StreamController<Resource> _responseController = StreamController<Resource>();
  Stream<Resource> get response => _responseController.stream;

  // USE CASE
  AuthUseCases _authUseCases;
  InstitutionsUseCases _institutionsUseCases;

  RegisterEvent(this._authUseCases, this._institutionsUseCases);

  Stream<Resource<List<Institution>>> getInstitutions() => _institutionsUseCases.getInstitutions.launch();

  register() async {
    final data = _state.toUser();
    
    if (_state.isValid()) {
      print('Formulario válido');
      await _authUseCases.register.launch(data);
    } else {
      print('Formulario inválido');
    }
  }

  loadInstitutions() async {
    await _institutionsUseCases.getInstitutions.launch();
  }

  changeInstitution(String value) {
    print('Valor de institution: ${value}');
    _state =
        _state.copyWith(institutionId: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeCareer(String value) {
    print('Valor de la carrera: ${value}');
    _state = _state.copyWith(careerId: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeEmail(String value) {
    _responseController.add(Init());
    final bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(
          email: const ValidationItem(error: 'No es un email válido'));
    } else if (value.length >= 6) {
      _state = state.copyWith(email: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(
          email: const ValidationItem(error: 'Al menos 6 carácteres'));
    }
    notifyListeners();
  }

  changeName(String value) {
    _state = _state.copyWith(name: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changePassword(String value) {
    _responseController.add(Init());
    if (value.length >= 4) {
      _state =
          state.copyWith(password: ValidationItem(value: value, error: ''));
    } else {
      _state = state.copyWith(
          password: const ValidationItem(error: 'Al menos 4 carácteres'));
    }
    notifyListeners();
  }

  changeLastname(String value) {
    _state = _state.copyWith(lastname: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changePhone(String value) {
    _responseController.add(Init());

    // Utiliza una expresión regular para verificar que solo hay dígitos
    final RegExp regex = RegExp(r'^\d+$');

    if (regex.hasMatch(value)) {
      if (value.length >= 10) {
        _state = state.copyWith(phone: ValidationItem(value: value, error: ''));
      } else {
        _state = state.copyWith(
            phone: const ValidationItem(error: 'Al menos 10 caracteres'));
      }
    } else {
      // Si hay caracteres no numéricos, muestra un mensaje de error
      _state = state.copyWith(
          phone: const ValidationItem(error: 'Ingrese solo dígitos'));
    }

    notifyListeners();
  }

  changeGender(String value) {
    print('Género: ${value}');
    _state = _state.copyWith(gender: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeSecurityQuestion(String value) {
    _state = _state.copyWith(
        securityQuestion: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeSecurityAnswer(String value) {
    _state = _state.copyWith(
        securityAnswer: ValidationItem(value: value, error: ''));
    notifyListeners();
  }

  changeUrlImg() {
    _state = _state.copyWith(urlImg: ValidationItem(value: '', error: ''));
    notifyListeners();
  }
}
