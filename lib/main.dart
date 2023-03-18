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
        // bottomNavigationBar: const BottomBar(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
        bottomNavigationBar: const BottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(3),
          child: FloatingActionButton(
            // backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
            backgroundColor: Colors.pinkAccent,
            child: const Icon(Icons.home_filled),
            onPressed: () => {},
            // setState(() {
            //   _currentIndex = 1;
            // }),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
