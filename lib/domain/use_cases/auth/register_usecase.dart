import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_linked/src/domain/models/student.dart';
import 'package:learn_linked/src/domain/models/user_data.dart';
import '../../repository/auth_repository.dart';

@Injectable()
class RegisterUseCase {
  AuthRepository _repository;

  RegisterUseCase(this._repository);

  launch(Student user) => _repository.register(user);

  // Future<void> register(UserData user) async {
  //   await _repository.register(user);
  // }

  // Future<List<Institution>> loadInstitutions() async {
  //   return await _repository.getInstitution();
  // }
}
