import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/songs_playlists_model.dart';
import 'package:music_app/widgets/song_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SongsPlaylistsModel>(
      builder: (context, model, child) {
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
                      'Welcome back ♫',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Text(
                      'Your top songs this week',
                      style: TextStyle(
                        fontSize: 28,
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
                      height: 2,
                      thickness: 1,
                    ),
                    ...(model.songs)
                        .map(
                          (item) => item['isTopSongOfTheWeek']
                              ? Column(
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
                                )
                              : const SizedBox(),
                        )
                        .toList()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
