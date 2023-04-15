// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/main.dart';

class User {
  final String createdAt;
  final String name;
  final String avatar;
  final String id;

  const User(
      {required this.avatar,
      required this.createdAt,
      required this.name,
      required this.id});

  factory User.fromJson(Map<String, dynamic> m) {
    return User(
      avatar: m['avatar'],
      createdAt: m['createdAt'],
      id: m['id'],
      name: m['name'],
    );
  }
}
