import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;

  Register({required this.toggle, super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); //validcheck
  //variables to store email and password
  String email = '';
  String password = '';

  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Register to BrewCrew'),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400], elevation: 0),
            onPressed: () {
              widget.toggle();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey, //access validation techniques
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  //will return null for all good and string if validation not good
                  validator: (value) =>
                      value!.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true, //for password protection
                  validator: (value) =>
                      value!.length < 6 ? 'Enter 6+ char' : null,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPaswword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Invalid Credentials';
                        });
                      }
                      //don't need else as the stream is already listening for authchanges(automatically show homepage)
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
