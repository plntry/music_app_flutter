import 'package:flutter/material.dart';
import 'package:music_app/widgets/pages/song_about_page.dart';

class SongListItem extends StatelessWidget {
  final String tag;
  final String image;
  final String songname;
  final String singer;
  final String duration;

  const SongListItem({
    required this.tag,
    required this.image,
    required this.songname,
    required this.singer,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 5, left: 10),
      leading: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SongAboutPage(
                tag: tag,
                image: image,
                songname: songname,
                singer: singer,
                duration: duration,
              ),
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ExactAssetImage('assets/images/$image'),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              songname,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              singer,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
