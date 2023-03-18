import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final IconData iconData;
  final String label;

  const BottomBarItem({
    required this.iconData,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              // setState(() {
              //   currentTab = 0;
              // });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: Colors.white,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
