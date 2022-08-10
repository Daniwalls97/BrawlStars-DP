import 'dart:developer';
import 'package:brawlstars/src/api/constants.dart';
import 'package:brawlstars/src/models/brawlers.dart';
import 'package:http/http.dart' as http;

class ApiService {
  getBrawlers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.brawlersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Brawlers brawlers = brawlersFromJson(response.body);
        return brawlers.list;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
