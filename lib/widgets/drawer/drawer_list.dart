import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/theme_settings_model.dart';
import './drawer_list_item.dart';
import '/widgets/pages/friends_page.dart';

class DrawerList extends StatelessWidget {
  final BuildContext context;

  DrawerList({
    required this.context,
    Key? key,
  })  : listItemProps = [
          {
            'icon': Icons.person_add,
            'label': 'Friends',
            'onPressedHandler': () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FriendsPage(),
                ),
              );
            },
          },
          {
            'icon': Icons.save,
            'label': 'Saved Songs',
            'onPressedHandler': () {},
          },
          {
            'icon': Icons.brightness_4,
            'label': 'Change theme',
            'onPressedHandler': () {
              final settings =
                  Provider.of<ThemeSettingsModel>(context, listen: false);
              settings.toggleTheme();
            },
          },
          {
            'icon': Icons.settings,
            'label': 'Settings',
            'onPressedHandler': () {},
          },
          {
            'icon': Icons.person_add_outlined,
            'label': 'Invite Friends',
            'onPressedHandler': () {},
          },
          {
            'icon': Icons.question_mark_outlined,
            'label': 'Q&A',
            'onPressedHandler': () {},
          }
        ],
        super(key: key);

  final List<Map<String, dynamic>> listItemProps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 65,
      ),
      child: Column(
        children: [
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ...(listItemProps)
              .map(
                (item) => Column(
                  children: [
                    DrawerListItem(
                      iconData: item['icon'] as IconData,
                      label: item['label'] as String,
                      onPressedHandler: item['onPressedHandler'],
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                    ),
                  ],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
