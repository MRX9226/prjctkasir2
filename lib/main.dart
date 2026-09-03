import 'package:flutter/material.dart';
import 'screens/kasir_screen.dart';

void main() {
  runApp(const KasirApp());
}

class KasirApp extends StatelessWidget {
  const KasirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kasir Toko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF233047),
        scaffoldBackgroundColor: const Color(0xFFFBF3E4),
        useMaterial3: true,
      ),
      home: const KasirScreen(),
    );
  }
}
