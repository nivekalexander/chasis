import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'webview_loader.dart'; // 🔹 Asegúrate de importar WebViewLoader

class MicrofrontendLoader {
  static Future<List<GoRoute>> loadMicrofrontends() async {
    final dio = Dio();
    try {
      final response = await dio.get('http://localhost:3000/microfrontends');
      final List<dynamic> microfrontends = response.data;

      return microfrontends
          .map((mf) => GoRoute(
                path: mf['path'],
                builder: (context, state) => WebViewLoader(url: mf['url']),
              ))
          .toList();
    } catch (e) {
      throw Exception('Error al cargar microfrontends: $e');
    }
  }
}
