import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/device_detector.dart';

class ApiGateway {
  static const String apiUrl =
      "https://chasis-service.aws.com/api/microfrontend";

  static Future<String> getMicrofrontendToShow() async {
    String deviceType = DeviceDetector.getDeviceType();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"device": deviceType}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['microfrontend_url'];
    } else {
      throw Exception("Error al obtener el microfrontend");
    }
  }
}
