import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/songs_playlists_model.dart';
import '/widgets/pages/playlist_songs_page.dart';
import '/widgets/addPlaylistModal/add_playlist_modal.dart';

class PlaylistsPage extends StatelessWidget {
  PlaylistsPage({super.key});

  final SongsPlaylistsModel model = SongsPlaylistsModel();

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
            children: [
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Check your playlists ♫',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return AddPlaylistModal(
                              onSave: (playlistName) {
                                SongsPlaylistsModel().addPlaylist(playlistName);
                              },
                            );
                          },
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: const Text(
                        'New playlist',
                      ),
                    ),
                  ],
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
