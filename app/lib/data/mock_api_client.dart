import 'dart:convert';

import 'package:http/http.dart' as http;

class MockApiClient {
  MockApiClient({required this.baseUrl});

  final String baseUrl;

  Uri _albumsUri() => Uri.parse('$baseUrl/albums');

  Future<List<Map<String, dynamic>>> fetchAlbums() async {
    final response = await http.get(_albumsUri());
    if (response.statusCode != 200) {
      throw MockApiException(
        'GET /albums failed: ${response.statusCode} ${response.body}',
      );
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw MockApiException('Expected JSON array from /albums');
    }
    return decoded.cast<Map<String, dynamic>>();
  }
}

class MockApiException implements Exception {
  MockApiException(this.message);

  final String message;

  @override
  String toString() => message;
}
