import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

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

class WebViewLoader extends StatelessWidget {
  final String url;

  const WebViewLoader({required this.url, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Microfrontend")),
      body: Center(
        child: Text("Cargando microfrontend desde $url..."),
      ),
    );
  }
}
