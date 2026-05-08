import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/album.dart';

class ApiClient {
  ApiClient({required this.baseUrl});

  final String baseUrl;

  Uri _albumsUri() => Uri.parse('$baseUrl/albums');

  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(_albumsUri());
    if (response.statusCode != 200) {
      throw ApiException(
        'GET /albums failed: ${response.statusCode} ${response.body}',
      );
    }
    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw ApiException('Expected JSON array from /albums');
    }
    return decoded
        .map((albumJson) => Album.fromJson(albumJson as Map<String, dynamic>))
        .toList();
  }
}

class ApiException implements Exception {
  ApiException(this.message);

  final String message;

  @override
  String toString() => message;
}
