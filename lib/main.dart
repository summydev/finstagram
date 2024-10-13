import 'package:finstagram/views/pages/login_page.dart';
import 'package:finstagram/views/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F-Instagram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
     initialRoute: 'login',
      routes: {
        'login': (context)=> LoginPage(),
        'signup': (context)=> SignupPage()
      },
    );
  }
}
