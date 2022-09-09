import 'dart:developer';

import 'package:http/http.dart' as http;

class Network {
  static Future<String?> get({
    required url,
  }) async {
    try {
      log('URL->$url');
      final response = await http.get(Uri.parse(url));
      return response.body;
    } catch (e) {
      log('Exception in GET->$e');
      return null;
    }
  }
}
