import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

final userFutureProvider = FutureProvider<List<User>>((ref) async {
  return UserRepository().getUsers();
});

class UserRepository {
  final apiURL = 'https://6439d50790cd4ba563eeb3c6.mockapi.io/api/v1/user';

  Future<List<User>> getUsers() async {
    var url = Uri.parse(apiURL);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
