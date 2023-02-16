import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn; //reverses the value
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignIn(toggle: toggleView)
        : Register(toggle: toggleView);
    // both needs this function to change the value, it is passed using constructor
  }
}
