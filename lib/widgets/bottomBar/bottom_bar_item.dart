import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  final void Function(int) onItemTapped;
  final int currentIndex;
  final IconData iconData;
  final String label;

  const BottomBarItem({
    required this.onItemTapped,
    required this.currentIndex,
    required this.iconData,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => onItemTapped(currentIndex),
      child: Column(
        children: [
          Icon(iconData),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
