import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //accesing the streamprovider
    final user = Provider.of<UserId?>(context);
    print(user);
    //listens for change and dynamically need to return either home or authenticate widget
    return Authenticate();
  }
}
