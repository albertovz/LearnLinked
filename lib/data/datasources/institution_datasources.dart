import 'dart:convert';

import 'package:learn_linked/src/domain/models/institution.dart';
import 'package:http/http.dart' as http;
abstract class InstitutionApiDatasource {
  Future<List<Institution>> getInstitutions();
}

class ApiInstitutionDatasourceImp implements InstitutionApiDatasource {
  static const String baseUrl = 'http://192.168.1.112';
  static const String routeRegister = '/api/v1';

  @override
  Future<List<Institution>> getInstitutions() async {
    print('llegué al datasource');
    // await apiUserDatasourceImp.getInstitutions();
    String url = '$baseUrl:3003$routeRegister/institution';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      final institutions =
          body.map((dynamic item) => Institution.fromJson(item)).toList();
      print(institutions);
      return institutions;
    } else {
      throw Exception('Error al obtener instituciones');
    }
  }
  
}