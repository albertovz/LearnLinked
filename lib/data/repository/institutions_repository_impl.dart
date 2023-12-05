import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_linked/src/core/constants.dart';
import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:learn_linked/src/domain/repository/institutions_repository.dart';

import '../../domain/utils/resource.dart';

@Injectable(as: InstitutionsRepository)
class InstitutionsRepositoryImpl implements InstitutionsRepository {
  CollectionReference _institutionsRef;
  Reference _institutionsStorageRef;

  InstitutionsRepositoryImpl(@Named(INSTITUTIONS) this._institutionsRef, @Named(INSTITUTIONS) this._institutionsStorageRef);

  @override
  Stream<Resource<List<Institution>>> getInstitutions() {
    try {
      final data = _institutionsRef.snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(document.docs.map((institution) {
            final id = institution.id;
            final map = {...institution.data() as Map<String, dynamic>, 'id': id};
            return Institution.fromJson(map);
          }).toList()));
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error deconocido');
    }
  }


}
