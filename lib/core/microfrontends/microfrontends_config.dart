import 'dart:convert';
import 'package:flutter/services.dart';

class MicrofrontendsConfig {
  static List<dynamic> microfrontends = [];

  static Future<void> fetchMicrofrontends() async {
    final String response =
        await rootBundle.loadString('assets/microfrontends.json');
    microfrontends = json.decode(response)['microfrontends'];
  }
}
