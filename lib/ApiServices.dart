import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiUrl = 'https://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=1';

  static Future<int> fetchRandomNumber() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data[0];
    } else {
      throw Exception('Failed to load random number');
    }
  }
}
