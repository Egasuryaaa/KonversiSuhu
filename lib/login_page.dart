import 'package:flutter/material.dart';
import 'package:konversisuhu/kalkulator_home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String useremail = "username@pensmail.com";
  String pass = "123456";
  String notif = " ";

  void login(String email, String password) {
    if (email == useremail && password == pass) {
      setState(() {
        notif = " ";
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuhuKonversi()),
      );
    } else {
      setState(() {
        notif = " email atau password salah";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 216, 255),
        title: const Text(
          "Log In to Your Account",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: "Enter Email"),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => login(
                emailController.text.toString(),
                passwordController.text.toString(),
              ),
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 104, 172, 255),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              notif,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}