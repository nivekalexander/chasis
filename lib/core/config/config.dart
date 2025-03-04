import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get environment {
    return dotenv.env['ENVIRONMENT'] ??
        'local'; // Opciones: local, qa, production
  }
}
