import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<dynamic>? usersData;

  @override
  void initState() {
    super.initState();
    _fetchUsersData();
  }

  Future<void> _fetchUsersData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
    final decodedData = json.decode(response.body);

    setState(() {
      usersData = parseJson(decodedData['results']);
    });
  }

  List<dynamic> parseJson(List<dynamic> jsonData) {
    return jsonData.map((user) {
      final name = user['name'];
      final picture = user['picture'];

      return {
        'firstName': name['first'],
        'lastName': name['last'],
        'email': user['email'],
        'thumbnail': picture['thumbnail'],
        'largePicture': picture['large'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        backgroundColor: Colors.pink,
      ),
      body: usersData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: usersData?.length,
              itemBuilder: (context, index) {
                final userData = usersData![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userData['thumbnail']),
                  ),
                  title:
                      Text('${userData['firstName']} ${userData['lastName']}'),
                  subtitle: Text('${userData['email']}'),
                );
              },
            ),
    );
  }
}
