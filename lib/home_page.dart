import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  String? surname;
  String? phone;

  void _getUserInfoFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name");
    surname = prefs.getString("surname");
    phone = prefs.getString("phone");
    setState(() {});
  }

  @override
  void initState() {
    _getUserInfoFromDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          //Gradient özelliği eklemek için kullanılan widget
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromARGB(255, 138, 194, 239),
              Color.fromARGB(255, 250, 163, 192),
              Color.fromARGB(255, 239, 184, 249),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text("$name $surname $phone"),
              
            ),
          ],
        ),
      ),
    );
  }
}
