import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/snackbars.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL Sign Up
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendMailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, ContentType.failure);
    }
  }

  Future<void> sendMailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(
        context,
        'Email verification send.',
        ContentType.success,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, ContentType.failure);
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //if logined user don't have email verified
      if (!_auth.currentUser!.emailVerified) {
        await sendMailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!, ContentType.failure);
    }
  }
}
