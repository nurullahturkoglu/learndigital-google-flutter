import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/UserModel.dart';
import '../repository/user_repository.dart';

class UserState extends StateNotifier<List<User>> {
  UserState() : super([]);

  Future<void> getPost() async {
    try {
      final userList = await UserRepository().getUsers();
      state = userList;
    } catch (e) {
      print(e);
    }
  }

  // void updateName(String name) {
  //   state = state.copyWith(name: name);
  // }

  // void updateAge(String age) {
  //   state = state.copyWith(age: int.parse(age));
  // }
}

class UserListState extends StateNotifier<List<User>> {
  UserListState(List<User> initialState) : super(initialState);

  void addUser(User user) {
    state = [...state, user];
  }
}

final userStateProvider = StateNotifierProvider<UserState, List<User>>((ref) {
  return UserState();
});

final userListStateProvider =
    StateNotifierProvider<UserListState, List<User>>((ref) {
  return UserListState([]);
});
