import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants/app_constant.dart';
import 'package:mini_project/main.dart';
import 'package:mini_project/screens/sign_up.dart';
import 'package:mini_project/widgets/utils.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryBgColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: primaryColor)),
                    style: TextStyle(color: primaryColor),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid Email'
                            : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: primaryColor)),
                    obscureText: true,
                    style: TextStyle(color: primaryColor),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value == null ? 'Enter the password' : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => signIn(),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        backgroundColor: secondaryBgColor),
                    icon: Icon(
                      Icons.lock_open,
                      size: 32,
                      color: secondaryColor,
                    ),
                    label: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 24, color: secondaryColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Have Account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      MaterialButton(
                        child: Text(
                          'Sign Up!',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('Success Login');
    } on FirebaseAuthException catch (e) {
      print('error : $e');
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
