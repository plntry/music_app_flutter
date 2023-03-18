import 'package:flutter/material.dart';
import 'package:music_app/widgets/song_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final listItemProps = const [
    {
      'tag': 'nickprospertoday',
      'image': 'nickprosper.jpg',
      'songname': 'Today',
      'singer': 'Nick Prosper',
      'duration': '2:44',
    },
    {
      'tag': 'snowstrippersyouvedoneitthistime',
      'image': 'snowstrippers.jpg',
      'songname': 'You\'ve Done It This Time',
      'singer': 'Snow Strippers',
      'duration': '2:04',
    },
    {
      'tag': 'piercetheveilhellabove',
      'image': 'piercetheveil.jpg',
      'songname': 'Hell Above',
      'singer': 'Pierce The Veil',
      'duration': '3:44',
    }
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
                ...(listItemProps)
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
                    .toList()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
