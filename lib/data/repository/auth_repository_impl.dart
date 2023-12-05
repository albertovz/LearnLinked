import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_linked/src/core/constants.dart';
import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/models/student.dart';
import 'package:learn_linked/src/domain/models/user_data.dart';
import 'package:learn_linked/src/domain/repository/auth_repository.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuth _firebaseAuth;
  CollectionReference _usersRef;
  static const String baseUrl = 'http://192.168.0.29';
  static const String routeRegister = '/api/v1';

  AuthRepositoryImpl(this._firebaseAuth, @Named(USERS) this._usersRef);

  @override
  Future<Resource> login(
      {required String email, required String password}) async {
    try {
      UserCredential data = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Success(data);
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  @override
  Future<List<Institution>> getInstitution() async {
    print('llegó al datasource');
    String url = '$baseUrl:3003$routeRegister/institution';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      List<dynamic> institutionsData = body['institution'];
      final institutions = institutionsData
          .map((dynamic item) => Institution.fromJson(item))
          .toList();
      print(institutions);
      return institutions;
    } else {
      throw Exception('Error al obtener instituciones');
    }
  }

  @override
  Future<Resource> register(Student student) async {
    final Dio dio = Dio();

    Response response;
    // try {
    //   UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
    //       email: user.email, password: user.password);
    //   // user.password = "";
    //   user.id = data.user?.uid ?? '';
    //   await _usersRef.doc(user.id).set(user.toJson());
    //   return Success(data);
    // } on FirebaseAuthException catch (e) {
    //   return Error(e.message ?? "Error desconocido");
    // }
    try {
      print("$baseUrl:3002$routeRegister/user");
      response = await dio.post(
        "$baseUrl:3002$routeRegister/user/",
        data: {
          'name': student.name,
          'lastname': student.lastname,
          'phone': student.phone,
          'gender': student.gender,
          'email': student.email,
          'password': student.password,
          'institution_id': int.parse(student.institutionId),
          'career_id': int.parse(student.careerId),
          'securityQuestion': int.parse(student.securityQuestion),
          'securityAnswer': student.securityAnswer,
        },
      );
      print("Respinse $response");
    } catch (e) {
      print("Error: $e");
      throw Exception("Failed to log in");
    }
    if (response.statusCode == 201) {
      print("Status 201 OK");
      return Success('El usuario se ha creado correctamente');
    } else {
      print("Error en el login, estado: ${response.statusCode}");
      throw Exception('Failed to log in');
    }
  }

  // @override
  // Future<List<Institution>> getInstitution() async {
  // return await apiUserDatasourceImp.getInstitutions();
  // String url = '$baseUrl:3003$routeRegister/institution';
  // final response = await http.get(Uri.parse(url));

  // if (response.statusCode == 200) {
  //   List<dynamic> body = jsonDecode(response.body);
  //   final institutions =
  //       body.map((dynamic item) => Institution.fromJson(item)).toList();
  //   print(institutions);
  //   return institutions;
  // } else {
  //   throw Exception('Error al obtener instituciones');
  // }
  // final Dio dio = Dio();
  // print("$baseUrl:3003/$routeRegister/institution");
  // Response response;
  // try {
  //   response = await dio.get("$baseUrl:3003$routeRegister/institution");
  //   print("Response: $response");

  // } catch (e) {
  //   print("Error: $e");
  //   throw Exception("Failed to log in");
  // }
  // if (response.statusCode == 201) {
  //   print("Status 201 OK");
  //   // return Success('El usuario se ha creado correctamente');
  //   // final token = response.data['token'];

  //   // await saveAuthToken(token);

  //   // return response.data; // Ahora el tipo de retorno es String
  // } else {
  //   print("Error en el login, estado: ${response.statusCode}");
  //   throw Exception('Failed to log in');
  // }
  // }
  //

  // try {
  //   UserCredential data = await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: user.email, password: user.password);
  //   // user.password = "";
  //   user.id = data.user?.uid ?? '';
  //   await _usersRef.doc(user.id).set(user.toJson());
  //   return Success(data);
  // } on FirebaseAuthException catch (e) {
  //   return Error(e.message ?? "Error desconocido");
  // }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
