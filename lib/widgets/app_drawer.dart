import 'package:flutter/material.dart';
import 'package:music_app/widgets/drawer_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color.fromARGB(255, 225, 91, 137),
      child: DrawerList(),
    );
  }
}
