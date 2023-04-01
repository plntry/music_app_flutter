import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/songs_playlists_model.dart';

class AddPlaylistModal extends StatefulWidget {
  final void Function(String playlistName) onSave;

  const AddPlaylistModal({
    required this.onSave,
    super.key,
  });

  @override
  State<AddPlaylistModal> createState() => _AddPlaylistModalState();
}

class _AddPlaylistModalState extends State<AddPlaylistModal> {
  final _formKey = GlobalKey<FormState>();
  String _playlistName = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        color: Colors.pink.shade50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add New Playlist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: TextFormField(
                // autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Playlist Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter playlist name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _playlistName = value!;
                  });

                  final model =
                      Provider.of<SongsPlaylistsModel>(context, listen: false);
                  model.addPlaylist(value!);
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.onSave(_playlistName);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
