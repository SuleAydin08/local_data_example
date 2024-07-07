import 'package:flutter/material.dart';
import 'package:flutter_web_homework/login_page.dart';

void main() {
  runApp(const LocalDataExample());
}

class LocalDataExample extends StatelessWidget {
  const LocalDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LoginPage(),
    );
  }
}