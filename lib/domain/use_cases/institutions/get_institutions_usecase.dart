import 'package:injectable/injectable.dart';
import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/repository/institutions_repository.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';

@Injectable()
class GetInstitutionsUseCase {

  InstitutionsRepository _repository;

  GetInstitutionsUseCase(this._repository);

  Stream<Resource<List<Institution>>> launch() => _repository.getInstitutions();

}