import 'package:flutter/material.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  final playlists = const [
    'я граю в компік не напрягаюсь',
    'кубожевілля',
    'sleep radio',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 50,
                ),
                child: Text(
                  'Check your playlists ♫',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                const Divider(
                  height: 50,
                  thickness: 1,
                ),
                ...(playlists)
                    .map((playlist) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playlist,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Divider(
                              height: 50,
                              thickness: 1,
                            ),
                          ],
                        ))
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
