import 'package:flutter/material.dart';

import './widgets/bottom_bar.dart';
import './widgets/app_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              child: Icon(Icons.settings),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: const Text('main body'),
        floatingActionButton: FloatingActionButton(
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.pinkAccent,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: const BottomBar(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
