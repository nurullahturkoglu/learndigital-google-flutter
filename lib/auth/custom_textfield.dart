import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ExtStrings on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.borderRadiusValue,
    this.contentPaddingValue,
    required this.hintTextValue,
    this.inputFormatters,
    required this.validator,
    this.onChanged,
    this.obscureText,
    this.prefixIcon,
    required this.onSaved,
  });

  final double? contentPaddingValue;
  final double? borderRadiusValue;
  final String hintTextValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final Icon? prefixIcon;
  final Null Function(dynamic value) onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          obscureText: obscureText ?? false,
          onSaved: onSaved,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(contentPaddingValue ?? 0),
              prefixIcon: prefixIcon,
              labelText: hintTextValue,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(borderRadiusValue ?? 0),
              )),
              hintText: hintTextValue),
          onChanged: onChanged,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
