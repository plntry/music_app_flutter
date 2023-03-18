import 'package:flutter/material.dart';
import 'package:music_app/widgets/bottom_bar_item.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  final bottomBarItemProps = const [
    {
      'icon': Icons.home_filled,
      'label': 'Home',
    },
    {
      'icon': Icons.search_rounded,
      'label': 'Search',
    },
    {
      'icon': Icons.playlist_play,
      'label': 'Playlists',
    },
    {
      'icon': Icons.library_music,
      'label': 'Albums',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.pink,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 73,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ...(bottomBarItemProps)
                  .map(
                    (item) => BottomBarItem(
                      iconData: item['icon'] as IconData,
                      label: item['label'] as String,
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
