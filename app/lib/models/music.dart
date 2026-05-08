class Song {
  const Song({
    required this.id,
    required this.title,
    required this.durationMs,
  });
  final String id;
  final String title;
  final int durationMs;
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] as String,
      title: json['title'] as String,
      durationMs: json['durationMs'] as int,
    );
  }
}