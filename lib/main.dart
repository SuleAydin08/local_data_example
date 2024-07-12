import 'package:flutter/material.dart';
import 'package:flutter_web_homework/home_page.dart';
import 'package:flutter_web_homework/login_page.dart';
import 'package:flutter_web_homework/sing_up_page.dart';
import 'package:flutter_web_homework/sms_page.dart';

void main() {
  runApp(const LocalDataExample());
}

class LocalDataExample extends StatelessWidget {
  const LocalDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/sing_up_page":(context) => SingUpPage(),
        "/":(context) => LoginPage(),
        "/home_page": (context) =>  HomePage(), 
        "/sms_page":(context) =>  SmsPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}