import 'package:flutter/material.dart';
import 'package:music_app/widgets/drawer_list_item.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  final listItemProps = const [
    {
      'icon': Icons.person_add,
      'label': 'Friends',
    },
    {
      'icon': Icons.save,
      'label': 'Saved Songs',
    },
    {
      'icon': Icons.settings,
      'label': 'Settings',
    },
    {
      'icon': Icons.person_add_outlined,
      'label': 'Invite Friends',
    },
    {
      'icon': Icons.question_mark_outlined,
      'label': 'Q&A',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 65,
      ),
      child: Column(
        children: [
          ...(listItemProps)
              .map(
                (item) => DrawerListItem(
                  iconData: item['icon'] as IconData,
                  label: item['label'] as String,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
