import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

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
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(46, 255, 255, 255)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text(
                        "Log in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    //Login sayfasının login buttonu
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)),
                      width: 325,
                      height: 45,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/sms_page");
                        },
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    //spacer o aralığı ayır demek için kullanırız.
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/sing_up_page");
                            },
                            child: const Text("Sing Up"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
