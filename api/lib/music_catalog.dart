import 'dart:convert';
import 'dart:math';

class Song {
  Song({required this.id, required this.title, required this.durationMs});

  final String id;
  final String title;
  final int durationMs;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'durationMs': durationMs,
  };
}

class Album {
  Album({
    required this.id,
    required this.title,
    required this.genre,
    required this.songs,
  });

  final String id;
  final String title;
  final String genre;
  final List<Song> songs;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genre': genre,
    'songs': songs.map((s) => s.toJson()).toList(),
  };
}

class Artist {
  Artist({required this.id, required this.name, required this.albumIds});

  final String id;
  final String name;
  final List<String> albumIds;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'albumIds': albumIds,
  };
}

class MusicCatalog {
  MusicCatalog({required this.albums, required this.artists});

  final List<Album> albums;
  final List<Artist> artists;

  static const List<String> _genres = [
    'Rock',
    'Jazz',
    'Electronic',
    'Hip-hop',
    'Classical',
    'Pop',
    'Metal',
    'Folk',
    'Blues',
    'Reggae',
  ];

  static MusicCatalog generate() {
    final random = Random(42);
    final albums = <Album>[];
    for (var i = 0; i < 10; i++) {
      final songCount = 6 + random.nextInt(8);
      final songs = <Song>[];
      for (var s = 0; s < songCount; s++) {
        songs.add(
          Song(
            id: 'song-$i-$s',
            title: 'Track ${s + 1}',
            durationMs: 120000 + random.nextInt(240000),
          ),
        );
      }
      albums.add(
        Album(
          id: 'album-$i',
          title: 'Album ${i + 1}',
          genre: _genres[i],
          songs: songs,
        ),
      );
    }

    final artists = <Artist>[];
    for (var a = 0; a < 10; a++) {
      final albumIds = <String>{};
      var offset = 0;
      while (albumIds.length < 4) {
        albumIds.add('album-${(a + offset) % 10}');
        offset += 3;
      }
      artists.add(
        Artist(
          id: 'artist-$a',
          name: 'Artist ${a + 1}',
          albumIds: albumIds.toList()..sort(),
        ),
      );
    }

    return MusicCatalog(albums: albums, artists: artists);
  }

  String albumsJson() =>
      jsonEncode(albums.map((a) => a.toJson()).toList(growable: false));

  String artistsJson() =>
      jsonEncode(artists.map((a) => a.toJson()).toList(growable: false));
}
