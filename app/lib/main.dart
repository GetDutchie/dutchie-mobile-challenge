import 'package:flutter/material.dart';

import 'albums/albums_page.dart';
import 'artists/artists_page.dart';
import 'data/api_client.dart';
import 'playlist/playlist_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MusicApp(client: ApiClient(baseUrl: defaultApiBaseUrl())));
}

String defaultApiBaseUrl() {
  return const String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:1123',
  );
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key, required this.client});

  final ApiClient client;

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

  final ApiClient client;

  @override
  State<MusicShell> createState() => _MusicShellState();
}

class _MusicShellState extends State<MusicShell> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const AlbumsPage(),
      const ArtistsPage(),
      PlaylistPage(songs: const[])
    ];

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: IndexedStack(index: _index, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
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
