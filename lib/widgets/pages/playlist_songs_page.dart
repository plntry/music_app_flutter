import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/songs_playlists_model.dart';
import 'package:music_app/widgets/song_list_item.dart';

class PlaylistSongsPage extends StatelessWidget {
  final List songsIds;

  const PlaylistSongsPage({
    required this.songsIds,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go back'),
        backgroundColor: Colors.pink,
      ),
      body: Consumer<SongsPlaylistsModel>(
        builder: (context, model, child) {
          return songsIds.isEmpty
              ? const Center(
                  child: Text(
                    'There\'re no songs yet',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              : ListView(
                  children: [
                    const Divider(
                      height: 2,
                      thickness: 1,
                    ),
                    ...(model.getSongsByIds(songsIds))
                        .map((item) => Column(
                              children: [
                                SongListItem(
                                  tag: item['tag'] as String,
                                  image: item['image'] as String,
                                  songname: item['songname'] as String,
                                  singer: item['singer'] as String,
                                  duration: item['duration'] as String,
                                ),
                                const Divider(
                                  height: 2,
                                  thickness: 1,
                                ),
                              ],
                            ))
                        .toList(),
                  ],
                );
        },
      ),
    );
  }
}
