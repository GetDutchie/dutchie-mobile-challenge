import 'package:flutter/material.dart';
import '../data/api_client.dart';
import '../models/album.dart';
import '../models/music.dart';
import '../models/artist.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({
    super.key,
    required this.client,
  });
  final ApiClient client;
  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}
class _PlaylistPageState extends State<PlaylistPage> {
  final List<PlaylistEntry> _playlistSongs = [];
  late final Future<PlaylistData> _playlistDataFuture;
  
  @override
  void initState() {
    super.initState();
    _playlistDataFuture = _loadPlaylistData();
  }
  
  void _addSong(Song song, Album album, String artistNames) {
    setState(() {
      _playlistSongs.add(
        PlaylistEntry(
          song: song,
          album: album,
          artistNames: artistNames,
        ),
      );
    });
  }
  
  void _removeSong(PlaylistEntry entry) {
    setState(() {
      _playlistSongs.remove(entry);
    });
  }

  String _artistNamesForAlbum(Album album, List<Artist> artists) {
    final names = artists
        .where((artist) => artist.albumIds.contains(album.id))
        .map((artist) => artist.name)
        .toList();
    if (names.isEmpty) {
      return 'Unknown artist';
    }
    return names.join(', ');
  }

  Future<PlaylistData> _loadPlaylistData() async {
    final albums = await widget.client.fetchAlbums();
    final artists = await widget.client.fetchArtists();
    return PlaylistData(
      albums: albums,
      artists: artists,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: ListView(
        children: [
          _buildPlaylistSection(),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Expand albums and tap + to add songs to your playlist')
          ),
          _buildAlbumsSection(),
        ],
      ),
    );
  }

  Widget _buildPlaylistSection() {
    if (_playlistSongs.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('No songs added yet'),
      );
    }

    return Column(
      children: [
        const ListTile(
          title: Text('My Playlist'),
        ),
        ..._playlistSongs.map((entry) {
          return ListTile(
            leading: Image.network(
              entry.album.imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
            title: Text(entry.song.title),
            subtitle: Text(
              '${entry.artistNames} - ${entry.album.title} - ${entry.song.durationLabel}',
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Remove song',
              onPressed: () => _removeSong(entry),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAlbumsSection() {
    return FutureBuilder<PlaylistData>(
      future: _playlistDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Could not load albums'),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          );
        }
        final data = snapshot.data!;
        final albums = data.albums;
        final artists = data.artists;
        return Column(
          children: albums.map((album) {
            final artistNames = _artistNamesForAlbum(album, artists);
            return ExpansionTile(
              leading: Image.network(
                album.imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
              title: Text(album.title),
              subtitle: Text('$artistNames - ${album.genre}'),
              children: album.songs.map((song) {
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.durationLabel),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add to playlist',
                    onPressed: () => _addSong(song, album, artistNames),
                  ),
                );
              }).toList(),
            );

          }).toList(),
        );
      },
    );
  }
}

class PlaylistData {
  const PlaylistData({
    required this.albums,
    required this.artists,
  });
  final List<Album> albums;
  final List<Artist> artists;
}

class PlaylistEntry {
  const PlaylistEntry({
    required this.song,
    required this.album,
    required this.artistNames,
  });
  final Song song;
  final Album album;
  final String artistNames;
}