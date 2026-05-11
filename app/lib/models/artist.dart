class Artist {

  const Artist({
    required this.id,
    required this.name,
    required this.albumIds,
  });

  final String id;
  final String name;
  final List<String> albumIds;

  factory Artist.fromJson(Map<String, dynamic> json) {
    final albumIdList = json['albumIds'] as List<dynamic>;
    return Artist(
      id: json['id'] as String,
      name: json['name'] as String,
      albumIds: albumIdList.map(
        (albumId) => albumId as String)
        .toList(),
    );
  }
}
