import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<List<dynamic>> getService({required String url}) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<dynamic> postService(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<dynamic> putService(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.put(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<dynamic> patchService(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.patch(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<void> deleteService({required String url}) async {
    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }
}
