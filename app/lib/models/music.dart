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

  String get durationLabel {
  final totalSeconds = durationMs ~/ 1000;
  final minutes = totalSeconds ~/ 60;
  final seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
}

