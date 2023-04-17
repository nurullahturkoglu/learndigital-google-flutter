import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/firebase_options.dart';

class FirebaseTest extends ConsumerStatefulWidget {
  const FirebaseTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirebaseTestState();
}

class _FirebaseTestState extends ConsumerState<FirebaseTest> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Deneme"),
    );
  }
}
