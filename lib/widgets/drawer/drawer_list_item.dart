import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final VoidCallback onPressedHandler;

  const DrawerListItem({
    required this.iconData,
    required this.label,
    required this.onPressedHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: TextButton(
        onPressed: onPressedHandler,
        style: TextButton.styleFrom(
          foregroundColor: Colors.pink,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              flex: 11,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
