import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool _playing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Player')),
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          children: [
            IconButton(
              iconSize: 48,
              onPressed: () {},
              icon: const Icon(Icons.skip_previous),
              tooltip: 'Previous',
            ),
            IconButton(
              iconSize: 64,
              onPressed: () {
                setState(() => _playing = !_playing);
              },
              icon: Icon(_playing ? Icons.pause : Icons.play_arrow),
              tooltip: _playing ? 'Pause' : 'Play',
            ),
            IconButton(
              iconSize: 48,
              onPressed: () {},
              icon: const Icon(Icons.skip_next),
              tooltip: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
