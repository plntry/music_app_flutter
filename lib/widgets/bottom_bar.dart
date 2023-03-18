import 'package:flutter/material.dart';

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
    // return BottomAppBar(
    //   color: Colors.pink,
    //   shape: const CircularNotchedRectangle(),
    //   notchMargin: 5,
    //   child: SizedBox(
    //     height: 60,
    //     child: Padding(
    //       padding: const EdgeInsets.only(
    //         right: 73,
    //       ),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.max,
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: <Widget>[
    //           ...(bottomBarItemProps)
    //               .map(
    //                 (item) => BottomBarItem(
    //                   iconData: item['icon'] as IconData,
    //                   label: item['label'] as String,
    //                 ),
    //               )
    //               .toList(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: BottomNavigationBar(
            // unselectedLabelStyle: TextStyle(
            //   color: Colors.white,
            // ),
            // currentIndex: _currentIndex,
            backgroundColor: Colors.pink,
            selectedItemColor: Colors.white,
            onTap: (index) {
              // setState(() {
              //   _currentIndex = index;
              // });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play),
                label: 'Playlists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_music,
                  color: Colors.white,
                ),
                label: 'Albums',
              )
            ]),
      ),
    );
  }
}
