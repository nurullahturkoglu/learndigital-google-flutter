import 'package:flutter/material.dart';
import '../palette.dart';

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }
}

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool isSecret;
  final Null Function(dynamic value) onSaved;
  final String? Function(String?)? validator;
  const LoginTextField({
    super.key,
    required this.hintText,
    required this.isSecret,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        style: const TextStyle(color: Pallete.whiteColor),
        obscureText: isSecret ? true : false,
        enableSuggestions: isSecret ? false : true,
        autocorrect: isSecret ? false : true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Pallete().fontColor, fontWeight: FontWeight.w500),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Pallete.borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Pallete.borderColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
