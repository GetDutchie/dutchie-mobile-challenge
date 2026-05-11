import 'package:flutter/material.dart';
import '../data/api_client.dart';
import '../models/album.dart';
import '../models/music.dart';

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
  final List<Song> _playlistSongs = [];
  late final Future<List<Album>> _albumsFuture;
  @override
  void initState() {
    super.initState();
    _albumsFuture = widget.client.fetchAlbums();
  }
  void _addSong(Song song) {
    setState(() {
      _playlistSongs.add(song);
    });
  }
  void _removeSong(Song song) {
    setState(() {
      _playlistSongs.remove(song);
    });
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
        ..._playlistSongs.map((song) {
          return ListTile(
            title: Text(song.title),
            subtitle: Text(song.durationLabel),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Remove song',
              onPressed: () => _removeSong(song),
            ),
          );
        }),
      ],
    );
  }
  Widget _buildAlbumsSection() {
    return FutureBuilder<List<Album>>(
      future: _albumsFuture,
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
        final albums = snapshot.data!;
        return Column(
          children: albums.map((album) {
            return ExpansionTile(
              leading: Image.network(
                album.imageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
              title: Text(album.title),
              subtitle: Text(album.genre),
              children: album.songs.map((song) {
                return ListTile(
                  title: Text(song.title),
                  subtitle: Text(song.durationLabel),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'Add to playlist',
                    onPressed: () => _addSong(song),
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