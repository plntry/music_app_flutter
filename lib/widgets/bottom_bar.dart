import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const BottomBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: Colors.pink.shade400,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play),
              label: 'Playlists',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
              ),
              label: 'Albums',
            )
          ],
        ),
      ),
    );
  }
}
