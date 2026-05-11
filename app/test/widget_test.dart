import 'package:app/models/music.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('durationLabel works as expected', () {
    const song = Song(
      id: 'song-1',
      title: 'Track 1',
      durationMs: 125000,
    );
    expect(song.durationLabel, '2:05');
  });
}