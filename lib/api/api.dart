import 'package:http/http.dart' as http;

import "dart:convert";

Future<String?> urlGenerator(String originalUrl) async {
  final url = Uri.parse("http://localhost:3000/url");
  try {
    final response = await http.post(
      url,
      headers: {'content-type': "application/json"},
      body: jsonEncode({"url": originalUrl}),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final shortId = data['url'];
      return 'http://localhost:3000/$shortId';
    } else {
      return "Error: ${response.statusCode}, body: ${response.body}";
    }
  } catch (e) {
    return e.toString();
  }
}
