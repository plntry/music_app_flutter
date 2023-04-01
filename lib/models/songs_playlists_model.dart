import 'package:flutter/material.dart';

class SongsPlaylistsModel extends ChangeNotifier {
  final _songs = const [
    {
      'tag': 'nickprospertoday',
      'image': 'nickprosper.jpg',
      'songname': 'Today',
      'singer': 'Nick Prosper',
      'duration': '2:44',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'hiroyukisawanovogelimkafig',
      'image': 'noimage.jpg',
      'songname': 'Vogel Im Kafig',
      'singer': 'Hiroyuki Sawano',
      'duration': '6:20',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'yvestumormeteorablues',
      'image': 'noimage.jpg',
      'songname': 'Meteora Blues',
      'singer': 'Yves Tumor',
      'duration': '3:48',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'snowstrippersyouvedoneitthistime',
      'image': 'snowstrippers.jpg',
      'songname': 'You\'ve Done It This Time',
      'singer': 'Snow Strippers',
      'duration': '2:04',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'jpegmafiadannybrownsteppapig',
      'image': 'noimage.jpg',
      'songname': 'Steppa Pig',
      'singer': 'JPEGMAFIA, Danny Brown',
      'duration': '3:28',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'piercetheveilhellabove',
      'image': 'piercetheveil.jpg',
      'songname': 'Hell Above',
      'singer': 'Pierce The Veil',
      'duration': '3:44',
      'isTopSongOfTheWeek': true,
    },
    {
      'tag': 'jpegmafiadannybrownleanbeefparty',
      'image': 'noimage.jpg',
      'songname': 'Lean Beef Party',
      'singer': 'JPEGMAFIA, Danny Brown',
      'duration': '1:48',
      'isTopSongOfTheWeek': true,
    }
  ];

  void addAudioFile(song) {
    _songs.add(song);
    notifyListeners();
  }

  List get songs => _songs;
}
