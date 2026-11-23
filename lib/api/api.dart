import 'package:http/http.dart' as http;

import "dart:convert";

const String baseUrl = "https://short-cut-p05c.onrender.com";

Future<String?> urlGenerator(String originalUrl) async {
  final url = Uri.parse("$baseUrl/url"); // 1. Changed here
  try {
    final response = await http.post(
      url,
      headers: {'content-type': "application/json"},
      body: jsonEncode({"url": originalUrl}),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final shortId = data['url'];
      return '$baseUrl/$shortId'; // 2. Changed here
    } else {
      return "Error: ${response.statusCode}, body: ${response.body}";
    }
  } catch (e) {
    return e.toString();
  }
}
