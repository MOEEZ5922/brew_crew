import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Center(child: Text("HOMEE")),
      ),
    );
  }
}
