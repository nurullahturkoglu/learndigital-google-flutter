import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/register_ui.dart';
import 'package:myapp/services/firebase_auth_methods.dart';
import '../palette.dart';
import '../widgets/custom_login_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  handleFormSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmailAndPassword(
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
                  ContinueWithButton(
                    buttonText: 'Continue with Google',
                    icon: Pallete().googleSvgIcon,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ContinueWithButton(
                    buttonText: 'Continue with Facebook',
                    icon: Pallete().facebookSvgIcon,
                  ),
                  const MidText(text: 'or'),
                  LoginTextField(
                    hintText: 'Email',
                    isSecret: false,
                    validator: (val) {
                      if (!ExtString(val!).isValidEmail) {
                        return 'Enter valid email';
                      }
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  LoginTextField(
                    hintText: "Password",
                    isSecret: true,
                    validator: (val) {
                      if (!ExtString(val!).isValidPassword) {
                        return 'Password need have minimum 8 character';
                      }
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SingInButton(
                    buttonText: 'Log in',
                    onPressed: handleFormSave,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(
                        flex: 2,
                        child: GreyText(text: 'Dont have an account?'),
                      ),
                      Flexible(
                        flex: 2,
                        child: WhiteButton(
                          text: 'Create Account',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RegisterScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: WhiteButton(
                      onPressed: () {},
                      text: "Forgot Password?",
                    ),
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

class WhiteButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const WhiteButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Pallete.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.fade,
      ),
    );
  }
}

class GreyText extends StatelessWidget {
  final String text;
  const GreyText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: Colors.grey.shade500,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      overflow: TextOverflow.fade,
    );
  }
}

class SingInButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  const SingInButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      height: 44.0,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Pallete.gradient1,
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Pallete.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MidText extends StatelessWidget {
  final String text;
  const MidText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16,
          color: Pallete().fontColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ContinueWithButton extends StatelessWidget {
  final String buttonText;
  final Widget icon;
  const ContinueWithButton({
    super.key,
    required this.buttonText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Click event on Container");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Pallete.borderColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              buttonText,
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Pallete().fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.asset(
        'assets/images/signin_balls.png',
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 35),
      child: Text(
        "Sign in.",
        style: GoogleFonts.roboto(
          fontSize: 36,
          color: Pallete.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
