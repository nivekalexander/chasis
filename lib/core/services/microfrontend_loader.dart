import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MicrofrontendLoader {
  static Future<List<GoRoute>> loadMicrofrontends() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/microfrontends'));

    if (response.statusCode == 200) {
      final List<dynamic> microfrontends = jsonDecode(response.body);
      return microfrontends
          .map((mf) => GoRoute(
                path: mf['path'],
                builder: (context, state) => _dynamicLoader(mf['url']),
              ))
          .toList();
    } else {
      throw Exception('Error al cargar microfrontends');
    }
  }

  static Widget _dynamicLoader(String url) {
    return Scaffold(body: Center(child: Text('Cargando desde $url...')));
  }
}
