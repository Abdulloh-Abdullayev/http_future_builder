import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_future_builder/models/user_model.dart';

class ServicUsers {
  static Future<List<PriseModel>> apiGet() async {
    Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
    dynamic response = await http.get(url);

    return (jsonDecode(response.body) as List)
        .map((e) => PriseModel.fromJson(e))
        .toList();
  }
}
