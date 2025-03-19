import 'package:flutter/material.dart';
import 'login_page.dart'; 

void main() {
  runApp(const SuhuKonversiApp());
}

class SuhuKonversiApp extends StatelessWidget {
  const SuhuKonversiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konversi Suhu',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue[900], // Warna latar navy
        primaryColor: Colors.blue[800], // Warna utama navy
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const SuhuKonversi(),
    );
  }
}

class SuhuKonversi extends StatefulWidget {
  const SuhuKonversi({Key? key}) : super(key: key);

  @override
  _SuhuKonversiState createState() => _SuhuKonversiState();
}

class _SuhuKonversiState extends State<SuhuKonversi> {
  double _inputValue = 0;
  Map<String, double> _convertedValues = {};

  void _convertTemperature() {
    setState(() {
      double celsius = _inputValue;
      _convertedValues = {
        "Celsius": celsius,
        "Fahrenheit": celsius * 9 / 5 + 32,
        "Kelvin": celsius + 273.15,
        "Reamur": celsius * 4 / 5
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Suhu"),
        centerTitle: true,
        backgroundColor: Colors.blue[800], // Warna navy lebih terang
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _inputValue = double.tryParse(value) ?? 0;
                  _convertTemperature();
                });
              },
              decoration: InputDecoration(
                labelText: "Masukkan suhu dalam Celsius",
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _convertedValues.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${entry.key}: ${entry.value.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
