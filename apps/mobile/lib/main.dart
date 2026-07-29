import 'package:flutter/material.dart';

void main() {
  runApp(const TazkiyahApp());
}

class TazkiyahApp extends StatelessWidget {
  const TazkiyahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tazkiyah OS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Tazkiyah OS'),
        ),
      ),
    );
  }
}
