import 'music.dart';

class Album {
  const Album({
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
  factory Album.fromJson(Map<String, dynamic> json) {
    final songList = json['songs'] as List<dynamic>;
    return Album(
      id: json['id'] as String,
      title: json['title'] as String,
      genre: json['genre'] as String,
      imageUrl: json['imageUrl'] as String,
      songs: songList
          .map((songJson) => Song.fromJson(songJson as Map<String, dynamic>))
          .toList(),
    );
  }
}