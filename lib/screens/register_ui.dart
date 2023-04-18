import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
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

  handleFormSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _messengerKey.currentState!.showSnackBar(
        snackBarTemplate('Register', ContentType.success),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
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
                      onPressed: handleFormSave,
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
                            onPressed: () {},
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
      ),
    );
  }
}
