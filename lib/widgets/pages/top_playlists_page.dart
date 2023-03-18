import 'package:flutter/material.dart';

class TopPlaylistsPage extends StatelessWidget {
  const TopPlaylistsPage({super.key});

  final playlists = const [
    'Rock Classics',
    'Songs to Sing in the Car',
    'All Out 2000s',
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
                  'Top playlists 🌍',
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
