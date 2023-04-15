import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/auth/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _mail;
  String? _phone;
  String? _password;

  final snackBarSuccess = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Successful!',
      message: 'Congrulations! Successful register.',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );

  handleFormSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_fullName $_mail $_phone $_password');
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBarSuccess);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomTextField(
                    hintTextValue: 'Full Name',
                    borderRadiusValue: 20,
                    contentPaddingValue: 20,
                    prefixIcon: const Icon(Icons.person),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                    validator: (val) {
                      if (!val!.isValidName) return 'Enter valid name';
                      return null;
                    },
                    onSaved: (value) {
                      _fullName = value;
                    }),
                CustomTextField(
                    hintTextValue: 'Mail',
                    borderRadiusValue: 20,
                    contentPaddingValue: 20,
                    prefixIcon: const Icon(Icons.mail),
                    validator: (val) {
                      if (!val!.isValidEmail) return 'Enter valid email';
                    },
                    onSaved: (value) {
                      _mail = value;
                    }),
                CustomTextField(
                    hintTextValue: 'Phone',
                    borderRadiusValue: 20,
                    contentPaddingValue: 20,
                    prefixIcon: const Icon(Icons.phone),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[0-9]"),
                      )
                    ],
                    validator: (val) {
                      if (!val!.isValidPhone) return 'Enter valid phone';
                    },
                    onSaved: (value) {
                      _phone = value;
                    }),
                CustomTextField(
                    hintTextValue: 'Password',
                    obscureText: true,
                    borderRadiusValue: 20,
                    contentPaddingValue: 20,
                    prefixIcon: const Icon(Icons.password_outlined),
                    validator: (val) {
                      if (!val!.isValidPassword) return 'Enter valid password';
                    },
                    onSaved: (value) {
                      _password = value;
                    }),
                ElevatedButton(
                    onPressed: handleFormSave, child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
