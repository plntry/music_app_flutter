import 'package:flutter/material.dart';

import '../../data/repositories/users_repository.dart';
import '../../data/models/user_model.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  late Future<List<dynamic>> usersData;

  @override
  void initState() {
    super.initState();

    setState(() {
      usersData = fetchUsersData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: usersData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred.'),
            );
          }
          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final userData = data[index] as User;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(userData.thumbnail),
                ),
                title: Text('${userData.firstName} ${userData.lastName}'),
                subtitle: Text(userData.email),
              );
            },
          );
        },
      ),
    );
  }
}
