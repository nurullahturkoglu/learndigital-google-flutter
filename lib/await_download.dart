import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repository/user_repository.dart';
import 'package:myapp/states/user_state.dart';

class AsyncDownloadClass extends ConsumerWidget {
  late bool isLoading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userFutureProvider);

    bool shouldPop = true;
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () {
                final posts = ref.read(userStateProvider.notifier).getPost();
              },
            )
          ],
        ),
        body: userList.when(
          data: (userList) => ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.createdAt),
                leading: Text(user.id.toString()),
              );
            },
          ),
          error: (error, stackTrace) => Text('An error occurred: $error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
