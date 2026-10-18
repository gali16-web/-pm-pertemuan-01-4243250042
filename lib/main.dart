import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

/// Fungsi utama (entry point) aplikasi Flutter.
void main() {
  runApp(const HelloWorldApp());
}

/// Root widget aplikasi Hello World untuk Tugas Rutin 1 Pemrograman Mobile.
///
/// Mengonfigurasi tema Material 3 dan menampilkan [HomeScreen] sebagai
/// halaman utama aplikasi.
class HelloWorldApp extends StatelessWidget {
  /// Membuat instance [HelloWorldApp].
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World - Muhammad Gali Almahdi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
