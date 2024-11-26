import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {

  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  final String _api =
      "https://pixabay.com/api/?key=42587908-2b66188e52ebc4be0752ca970&q";

  Future<Map> fetchApiData() async {
    Uri uri = Uri.parse(_api);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var json = jsonDecode(data);
      return json;
    }
    return {};
  }

  Future<Map> searchApi(String search)
  async {
    String api = "https://pixabay.com/api/?key=42587908-2b66188e52ebc4be0752ca970&q=$search";
    Uri uri = Uri.parse(api);
    Response response = await http.get(uri);
    if(response.statusCode==200)
      {
        String data = response.body;
        Map json = jsonDecode(data);
        return json;
      }
    return {};
  }



}
