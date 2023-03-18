import 'package:flutter/material.dart';

import './widgets/bottom_bar.dart';
import './widgets/drawer/app_drawer.dart';
import './widgets/pages/home_page.dart';
import './widgets/pages/playlists_page.dart';
import './widgets/pages/top_playlists_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  static const List<Widget> _navOptions = <Widget>[
    PlaylistsPage(),
    HomePage(),
    TopPlaylistsPage()
  ];

  void _onItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MDream',
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.5,
          backgroundColor: Colors.pink,
          title: const Text(
            'MDream',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search_rounded),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: _navOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(3),
          child: FloatingActionButton(
            foregroundColor: _selectedIndex == 1 ? Colors.white : Colors.black,
            backgroundColor:
                _selectedIndex == 1 ? Colors.pink : Colors.pink.shade300,
            child: const Icon(Icons.home_filled),
            onPressed: () => {
              setState(() {
                _selectedIndex = 1;
              })
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
