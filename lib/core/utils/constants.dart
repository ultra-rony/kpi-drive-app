import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String baseUrl = "https://api.dev.kpi-drive.ru";
  static String? bearerToken = dotenv.env['DADATA_API_KEY'];
}
