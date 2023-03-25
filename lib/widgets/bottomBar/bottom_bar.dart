import 'package:flutter/material.dart';

import '../bottomBar/bottom_bar_item.dart';

class BottomBar extends StatelessWidget {
  final void Function(int) onItemTapped;

  const BottomBar({
    required this.onItemTapped,
    super.key,
  });

  final bottomBarItemProps = const [
    {
      'icon': Icons.playlist_play,
      'label': 'Playlists',
    },
    {
      'icon': Icons.library_music,
      'label': 'Top Playlists',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 51,
        padding: const EdgeInsets.only(
          top: 4,
        ),
        color: Colors.pink.shade400,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...(bottomBarItemProps)
                .asMap()
                .entries
                .map(
                  (entry) => BottomBarItem(
                    onItemTapped: onItemTapped,
                    currentIndex: entry.key,
                    iconData: entry.value['icon'] as IconData,
                    label: entry.value['label'] as String,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
