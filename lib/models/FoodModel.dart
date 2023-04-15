// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class Food {
  final String name;
  final int price;
  final String category;

  const Food({required this.name, required this.price, required this.category});

  Food copyWith({
    String? name,
    int? price,
    String? category,
  }) {
    return Food(
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }
}
