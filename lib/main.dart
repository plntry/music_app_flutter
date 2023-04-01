import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/bottomBar/bottom_bar.dart';
import './widgets/drawer/app_drawer.dart';
import './widgets/pages/home_page.dart';
import './widgets/pages/playlists_page.dart';
import './widgets/pages/top_playlists_page.dart';
import 'models/songs_playlists_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SongsPlaylistsModel(),
      child: const MaterialApp(
        title: 'MDream',
        home: StartWidget(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class StartWidget extends StatefulWidget {
  const StartWidget({super.key});

  @override
  State<StartWidget> createState() => _MyAppState();
}

class _MyAppState extends State<StartWidget> {
  int _selectedIndex = 2;

  static const List<Widget> _navOptions = <Widget>[
    PlaylistsPage(),
    TopPlaylistsPage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onItemTapped: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3),
        child: FloatingActionButton(
          foregroundColor: _selectedIndex == 2 ? Colors.white : Colors.black,
          backgroundColor:
              _selectedIndex == 2 ? Colors.pink : Colors.pink.shade300,
          child: const Icon(Icons.home_filled),
          onPressed: () => {
            _onItemTapped(2),
          },
        ),
      ),
    );
  }
}
