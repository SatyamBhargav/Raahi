import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class OpneAi {
  static const url = 'https://api.openai.com/v1/chat/completions';
  static Future<dynamic> postRequest({required String msg}) async {
    try {
      final result = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ApiKey',
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content": msg,
              },
              {
                "role": "user",
                "content": "Hello",
              }
            ],
          }));
      if (result.statusCode == 200) {
        print(result.body);
        final data = jsonDecode(result.body);
        return data['choices'][0]['message']['content'];
      }
      return null;
    } on HttpException catch (e) {
      print(e.message);
      return null;
    }
  }
}
