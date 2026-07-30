import 'package:flutter/material.dart';

import 'dashboard.dart';

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
      home: const DashboardView(),
    );
  }
}
