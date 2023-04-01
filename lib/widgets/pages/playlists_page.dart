import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/songs_playlists_model.dart';
import '/widgets/pages/playlist_songs_page.dart';

class PlaylistsPage extends StatelessWidget {
  const PlaylistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final playlists = Provider.of<SongsPlaylistsModel>(context).playlists;

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
                  thickness: 1,
                ),
                ...(playlists)
                    .map((playlist) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlaylistSongsPage(
                                        songsIds:
                                            Provider.of<SongsPlaylistsModel>(
                                                    context)
                                                .getSongsIdsForPlaylist(
                                                    playlist['name']),
                                      ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  foregroundColor: Colors.pink,
                                  alignment: Alignment.centerLeft,
                                ),
                                child: Text(
                                  playlist['name'],
                                ),
                              ),
                            ),
                            const Divider(
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
