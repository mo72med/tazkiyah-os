import 'package:flutter/material.dart';
import 'package:tazkiyah_core/core.dart';
import 'package:tazkiyah_identity/identity.dart';

void main() {
  runApp(const TazkiyahApp());
}

class TazkiyahApp extends StatelessWidget {
  const TazkiyahApp({super.key});

  @override
  Widget build(BuildContext context) {
    final identity = Identity(
      id: const Id('demo-identity'),
      displayName: 'Mohamed',
      mission: const Mission(
        'Build a life of worship, knowledge, and disciplined action.',
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tazkiyah OS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Tazkiyah OS')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Identity loaded successfully'),
              const SizedBox(height: 12),
              Text('Name: ${identity.displayName}'),
              const SizedBox(height: 8),
              Text('Mission: ${identity.mission.value}'),
            ],
          ),
        ),
      ),
    );
  }
}
