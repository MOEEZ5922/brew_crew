import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //authchangestream will send userobject that can be accessed by other beneath from root(wrapped with provider)
    return StreamProvider<UserId?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user, //will use user Stream
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
