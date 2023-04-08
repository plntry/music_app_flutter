import 'package:flutter/material.dart';

import './drawer_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 225, 91, 137),
      child: DrawerList(
        context: context,
      ),
    );
  }
}
