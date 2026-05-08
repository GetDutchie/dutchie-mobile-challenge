import 'package:flutter/material.dart';

import '../models/album.dart';
import '../models/music.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({
    super.key,
    required this.songs
    });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist')),
      body: const Center(child: Text('Playlist')),
    );
  }

  Widget _buildEmptyMessage() {
    return const Center(
      child: Text('No songs added yet'),
    );
  }
  
  Widget _buildSongList() {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          title: Text(song.title),
        );
      },
    );
  }
}
