import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:voluentie/Screens/intro_screen.dart';
import 'package:voluentie/Screens/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voluentie',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirebaseAuth.instance.currentUser != null ? const HomeScreen() : const IntroScreen(),
    );
  }
}
