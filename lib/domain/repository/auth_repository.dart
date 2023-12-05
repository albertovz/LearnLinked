import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/models/student.dart';
import 'package:learn_linked/src/domain/models/user_data.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';

abstract class AuthRepository {

  User? get user;
  Future<Resource> login ({required String email, required String password});
  Future<Resource> register (Student user);
  Future<List<Institution>> getInstitution();
  Future<void> logout();
}