import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_auth_methods.dart';
import 'package:myapp/widgets/snackbars.dart';
import '../palette.dart';
import '../widgets/custom_login_textfield.dart';
import 'login_ui.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  String _email = '';
  String _password = '';

  signUpUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseAuthMethods(FirebaseAuth.instance)
          .signUpWithEmailAndPassword(
              email: _email, password: _password, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.9, // color: Palette,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // const TopImage(),
                  const SignInText(),
                  LoginTextField(
                    hintText: 'Email',
                    isSecret: false,
                    validator: (val) {
                      if (!ExtString(val!).isValidEmail)
                        return 'Enter valid email';
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  LoginTextField(
                    hintText: "Password",
                    isSecret: true,
                    validator: (val) {
                      if (!ExtString(val!).isValidPassword)
                        return 'Password need have minimum 8 character';
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SingInButton(
                    buttonText: 'Sing in',
                    onPressed: signUpUser,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        flex: 2,
                        child: GreyText(text: 'Do you have an account'),
                      ),
                      Flexible(
                        flex: 2,
                        child: WhiteButton(
                          text: 'Log in',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
