import 'package:flutter/material.dart';

class SongAboutPage extends StatelessWidget {
  final String tag;
  final String image;
  final String songname;
  final String singer;
  final String duration;

  const SongAboutPage({
    required this.tag,
    required this.image,
    required this.songname,
    required this.singer,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.pink,
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Hero(
              tag: tag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('assets/images/$image'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$songname by $singer',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Song duration: $duration',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
