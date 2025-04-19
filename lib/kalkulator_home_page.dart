import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TemperatureProvider(),
      child: const SuhuKonversiApp(),
    ),
  );
}

class SuhuKonversiApp extends StatelessWidget {
  const SuhuKonversiApp({Key? key}) : super(key: key);

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
      home: const SuhuKonversi(),
    );
  }
}

class SuhuKonversi extends StatelessWidget {
  const SuhuKonversi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi Suhu"),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
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
                provider.setInputValue(double.tryParse(value) ?? 0);
              },
              decoration: InputDecoration(
                labelText: "Masukkan suhu dalam Celsius",
                labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
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
            Consumer<TemperatureProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: provider.convertedValues.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "${entry.key}: ${entry.value.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}