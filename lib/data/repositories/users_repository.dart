import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

List<User> parseJson(List<dynamic> jsonData) {
  return jsonData.map((user) => User.fromJson(user)).toList();
}

Future<List<dynamic>> fetchUsersData() async {
  final response =
      await http.get(Uri.parse('https://randomuser.me/api/?results=10'));
  final decodedData = json.decode(response.body);

  return parseJson(decodedData['results']);
}
