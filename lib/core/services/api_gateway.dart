import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/config.dart';

class ApiGateway {
  static Future<List<Map<String, String>>> getMicrofrontends() async {
    final response = await http.get(
      Uri.parse("${AppConfig.environment}/api/microfrontends"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return List<Map<String, String>>.from(jsonDecode(response.body));
    } else {
      throw Exception("Error al obtener los microfrontends");
    }
  }
}
