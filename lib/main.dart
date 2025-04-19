import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';
import 'login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TemperatureProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Suhu',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue[900],
        primaryColor: Colors.blue[800],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 132, 113, 113)),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const MyLoginPage(),
    );
  }
}