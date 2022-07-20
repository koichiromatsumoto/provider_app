import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/repository/armor_repository.dart';

import 'package:provider_app/model/entity/armors.dart';

Future<List<Armor>> fetchArmor() async {
  // var uri = Uri.parse('$APPDATA_UPDATE_API');
  Uri uri = Uri.parse('$APPDATA_UPDATE_API');
  var httpsUri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 5000,
      path: '/',
      queryParameters: {});

  final res = await http.get(httpsUri);
  // var armors = [];
  if (res.statusCode == 200) {
    // for (var jsonArmor in jsonDecode(res.body)) {
    //   armors.add(Armor.fromApiMap(jsonArmor));
    // }
    // return armors;
    List<Armor> armors = [];
    for (var jsonArmor in jsonDecode(res.body)) {
      armors.add(Armor.fromApiMap(jsonArmor));
    }
    return ArmorRepository.updateFromApi(armors);
  } else {
    throw Exception('Failed to Load AppdataUpdate');
  }
}