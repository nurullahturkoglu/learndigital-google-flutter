import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/FoodModel.dart';

final List<String> foods = [
  "Nohut",
  "Pilav",
  "Tavuk",
  'Izgara Kanat',
  'Piliç',
  'Soslu Makarna',
  'Et Döner',
  'Tavuk Döner',
];

final foodProvider = Provider<List<String>>((ref) {
  return foods;
});

Future<Food> downloadDinnerMeal() async {
  await Future.delayed(const Duration(seconds: 2));
  String downloadedItems = """{
      "name":"Kavurma",
      "category":"main",
      "price":12,
    }""";

  final m = jsonDecode(downloadedItems);
  return Food(name: m.name, price: m.price, category: m.category);
}

final foodNotifierProvider = StateNotifierProvider<FoodState, Food>((ref) {
  return FoodState();
});

class FoodState extends StateNotifier<Food> {
  FoodState()
      : super(
          const Food(
            category: '',
            name: '',
            price: 1,
          ),
        );

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }
}
