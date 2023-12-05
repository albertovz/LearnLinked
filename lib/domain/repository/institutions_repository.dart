import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/utils/resource.dart';

abstract class InstitutionsRepository {

    Stream<Resource<List<Institution>>> getInstitutions();


}