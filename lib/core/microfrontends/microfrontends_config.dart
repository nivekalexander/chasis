import 'dart:convert';
import 'package:flutter/services.dart';

class MicrofrontendsConfig {
  static Future<List<Map<String, String>>> fetchMicrofrontends() async {
    final String response =
        await rootBundle.loadString('assets/microfrontends.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, String>>();
  }
}
