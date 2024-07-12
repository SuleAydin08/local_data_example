import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  //Bir sayfada fonksiyon kullanılıyorsa stateful widget kullanmamız gerekir. Ben stateless kullandığım için context hata vermişti.
  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
//Biz text fieldlarımızı kontrol edebilmemniz için bir adet controllera ihtiyaç duyarız.
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
//Burada kullanıcı bilgileri kayıt edilir.
  void _saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", _nameController.text);
    prefs.setString("surname", _surnameController.text);
    prefs.setString("phone", _phoneController.text);
  }

  //Burada kullanıcı bilgileri çağırılır.
  void _checkUserFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    //Kullanıcı bilgilerini girmemiş olacağından burada null diye belirtiyoruz.
    final String? name = prefs.getString("name");
    final String? surname = prefs.getString("surname");
    final String? phone = prefs.getString("phone");
    //Yazdırma işlemi console yazacaktır.
    // print(name);
    // print(surname);
    // print(phone);
    if (name != null && surname != null && phone != null) {
      Navigator.pushNamed(context, "/home_page");
    }
  }

//Bu fonksiyon benim cihazımda veri var mı yok mu kontrol edecek.
  @override
  void initState() {
    _checkUserFromDevice();
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
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(46, 255, 255, 255)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Sing Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 10),
                      child: TextField(
                        //Burda controller vermemizin sebebi içerisine verilen değişkeni controller sebebiyle kontrol edebileceğiz.
                        controller: _surnameController,
                        decoration: InputDecoration(
                          hintText: 'Surname',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 10, bottom: 20),
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
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
                      child: Center(
                        //Buraya buton koymuştum geri aldım.
                        child: TextButton(
                          onPressed: () {
                            _saveUserToDevice();
                            Navigator.pushNamed(context, "/home_page");
                          },
                          child: const Text(
                            "Sing Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    //spacer o aralığı ayır demek için kullanırız.
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            },
                            child: const Text("Sign in"))
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
