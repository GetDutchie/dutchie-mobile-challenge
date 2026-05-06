import 'package:flutter/material.dart';

import 'albums/albums_page.dart';
import 'artists/artists_page.dart';
import 'data/mock_api_client.dart';
import 'player/player_page.dart';
import 'playlist/playlist_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MusicApp(client: MockApiClient(baseUrl: defaultApiBaseUrl())));
}

String defaultApiBaseUrl() {
  return const String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:1123',
  );
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key, required this.client});

  final MockApiClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MusicShell(client: client),
    );
  }
}

class MusicShell extends StatefulWidget {
  const MusicShell({super.key, required this.client});

  final MockApiClient client;

  @override
  State<MusicShell> createState() => _MusicShellState();
}

class _MusicShellState extends State<MusicShell> {
  int _index = 0;
  String? _albumFetchStatus;

  @override
  void initState() {
    super.initState();
    _loadAlbumCount();
  }

  Future<void> _loadAlbumCount() async {
    try {
      final albums = await widget.client.fetchAlbums();
      if (!mounted) return;
      setState(() {
        _albumFetchStatus = 'API: ${albums.length} albums';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _albumFetchStatus = 'API: unavailable ($e)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const PlayerPage(),
      const AlbumsPage(),
      const ArtistsPage(),
      const PlaylistPage(),
    ];

    return Scaffold(
      body: Column(
        children: [
          if (_albumFetchStatus != null)
            MaterialBanner(
              content: Text(_albumFetchStatus!),
              actions: [
                TextButton(
                  onPressed: () => setState(() => _albumFetchStatus = null),
                  child: const Text('DISMISS'),
                ),
              ],
            ),
          Expanded(
            child: IndexedStack(index: _index, children: pages),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.play_circle_outline),
            selectedIcon: Icon(Icons.play_circle),
            label: 'Player',
          ),
          NavigationDestination(
            icon: Icon(Icons.album_outlined),
            selectedIcon: Icon(Icons.album),
            label: 'Albums',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Artists',
          ),
          NavigationDestination(
            icon: Icon(Icons.queue_music_outlined),
            selectedIcon: Icon(Icons.queue_music),
            label: 'Playlist',
          ),
        ],
      ),
    );
  }
}
