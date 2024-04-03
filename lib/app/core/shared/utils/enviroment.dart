import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  static String? get apiUrl => dotenv.env['API_URL'];
  static String? get apiKey => dotenv.env['API_KEY'];
  static String? get accountId => dotenv.env['ACCOUNT_ID'];
  static String? get accessToken => dotenv.env['ACCESS_TOKEN'];
  static String? get imageUrl => dotenv.env['IMAGE_URL'];
}
