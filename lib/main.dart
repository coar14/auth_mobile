import 'package:auth_mobile/Screen/home.dart';
import 'package:auth_mobile/Screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBt2aqiEBvFncXJ8V4rc5lY3lOyI7Y-5z8",
      appId: "1:545496714923:android:d9c089bdeb76f21c2231ee",
      messagingSenderId: "545496714923",
      projectId: "final-auth-f163c",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
