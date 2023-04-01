import 'package:flutter/material.dart';

class SongsPlaylistsModel extends ChangeNotifier {
  final List<Map<String, Object>> _songs = [
    {
      'id': 0,
      'tag': 'nickprospertoday',
      'image': 'nickprosper.jpg',
      'songname': 'Today',
      'singer': 'Nick Prosper',
      'duration': '2:44',
      'isTopSongOfTheWeek': true,
    },
    {
      'id': 1,
      'tag': 'hiroyukisawanovogelimkafig',
      'image': 'noimage.jpg',
      'songname': 'Vogel Im Kafig',
      'singer': 'Hiroyuki Sawano',
      'duration': '6:20',
      'isTopSongOfTheWeek': true,
    },
    {
      'id': 2,
      'tag': 'yvestumormeteorablues',
      'image': 'noimage.jpg',
      'songname': 'Meteora Blues',
      'singer': 'Yves Tumor',
      'duration': '3:48',
      'isTopSongOfTheWeek': false,
    },
    {
      'id': 3,
      'tag': 'snowstrippersyouvedoneitthistime',
      'image': 'snowstrippers.jpg',
      'songname': 'You\'ve Done It This Time',
      'singer': 'Snow Strippers',
      'duration': '2:04',
      'isTopSongOfTheWeek': true,
    },
    {
      'id': 4,
      'tag': 'jpegmafiadannybrownsteppapig',
      'image': 'noimage.jpg',
      'songname': 'Steppa Pig',
      'singer': 'JPEGMAFIA, Danny Brown',
      'duration': '3:28',
      'isTopSongOfTheWeek': false,
    },
    {
      'id': 5,
      'tag': 'piercetheveilhellabove',
      'image': 'piercetheveil.jpg',
      'songname': 'Hell Above',
      'singer': 'Pierce The Veil',
      'duration': '3:44',
      'isTopSongOfTheWeek': true,
    },
    {
      'id': 6,
      'tag': 'jpegmafiadannybrownleanbeefparty',
      'image': 'noimage.jpg',
      'songname': 'Lean Beef Party',
      'singer': 'JPEGMAFIA, Danny Brown',
      'duration': '1:48',
      'isTopSongOfTheWeek': false,
    }
  ];

  final List<Map<String, Object>> _playlists = [
    {
      'name': 'я граю в компік не напрягаюсь',
      'songsIds': [1, 2, 4, 6],
    },
    {
      'name': 'кубожевілля',
      'songsIds': [1, 3, 5, 6],
    },
    {
      'name': 'sleep radio',
      'songsIds': [2, 4, 6],
    },
  ];

  void addPlaylist(playlistName) {
    final Map<String, Object> playlist = {
      'name': playlistName,
      'songsIds': [],
    };

    _playlists.add(playlist);

    notifyListeners();
  }

  List getSongsIdsForPlaylist(String playlistName) {
    final playlist = _playlists.firstWhere(
      (element) => element['name'] == playlistName,
    );

    return playlist['songsIds'] as List;
  }

  List<Map<String, Object>> getSongsByIds(List songIds) {
    List<Map<String, Object>> songs = [];

    for (var songId in songIds) {
      final song = _songs.firstWhere((element) => element['id'] == songId);
      songs.add(song);
    }

    return songs;
  }

  List get playlists => _playlists;

  List get songs => _songs;
}
