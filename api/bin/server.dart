import 'dart:io';

import 'package:music_mock_api/music_catalog.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

Middleware corsMiddleware() {
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
  };
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: headers);
      }
      final response = await innerHandler(request);
      return response.change(headers: {...response.headers, ...headers});
    };
  };
}

InternetAddress resolveBindAddress() {
  final raw = Platform.environment['BIND_HOST']?.trim();
  if (raw == null || raw.isEmpty || raw == 'localhost') {
    return InternetAddress.loopbackIPv4;
  }
  if (raw == '0.0.0.0' || raw == 'any') {
    return InternetAddress.anyIPv4;
  }
  return InternetAddress(raw);
}

Future<void> main(List<String> args) async {
  final catalog = MusicCatalog.generate();
  final router = Router()
    ..get('/albums', (_) {
      return Response.ok(
        catalog.albumsJson(),
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    })
    ..get('/artists', (_) {
      return Response.ok(
        catalog.artistsJson(),
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    });

  final port = int.tryParse(
        Platform.environment['PORT'] ?? '',
      ) ??
      1123;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsMiddleware())
      .addHandler(router.call);

  final server = await shelf_io.serve(handler, resolveBindAddress(), port);
  // ignore: avoid_print
  print('Listening on http://${server.address.host}:${server.port}');
}
