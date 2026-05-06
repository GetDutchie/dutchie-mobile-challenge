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
    required this.imageUrl,
    required this.songs,
  });

  final String id;
  final String title;
  final String genre;
  final String imageUrl;
  final List<Song> songs;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genre': genre,
    'imageUrl': imageUrl,
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

  static const List<String> _albumImageUrls = [
    'https://images.unsplash.com/photo-1511379938547-c1f69419868d?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1461783436728-0a9217714694?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1507838153414-b4b713384a76?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?auto=format&fit=crop&w=900&h=900&q=80',
    'https://images.unsplash.com/photo-1501612780327-45045538702b?auto=format&fit=crop&w=900&h=900&q=80',
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
          imageUrl: _albumImageUrls[i],
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
