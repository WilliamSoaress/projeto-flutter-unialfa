import 'package:http/http.dart' as http;
import 'package:project_app/api/api_constants.dart';
import 'package:project_app/models/teams.dart';

class Api {
  Future<List<Teams>?> getTeams() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Teams> _teams = teamModelFromJson(response.body);
        return _teams;
      }
    } catch (e) {
      print(e);
    }
  }
}
