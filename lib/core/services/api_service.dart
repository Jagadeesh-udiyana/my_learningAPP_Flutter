import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class ApiService {
  Future<dynamic> get(String endpoint, {Map<String, String>? params}) async {
    final uri = Uri.parse(
      AppConfig.baseUrl + endpoint,
    ).replace(queryParameters: params);

    final response = await http.get(
      uri,
      headers: {
        "authorization": AppConfig.authToken,
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error: ${response.statusCode}");
    }
  }
}
