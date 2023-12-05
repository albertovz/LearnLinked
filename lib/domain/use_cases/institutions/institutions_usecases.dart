import 'package:injectable/injectable.dart';
import 'package:learn_linked/src/domain/use_cases/institutions/get_institutions_usecase.dart';

@Injectable()
class InstitutionsUseCases {
  GetInstitutionsUseCase getInstitutions;

  InstitutionsUseCases({
    required this.getInstitutions,
  });
}
