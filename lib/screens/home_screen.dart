import 'package:flutter/material.dart';
import '../models/student_profile.dart';
import '../widgets/profile_card.dart';

/// Halaman utama aplikasi Hello World Flutter untuk Tugas Rutin 1.
///
/// Menampilkan pesan sapaan "Hello World!", identitas mahasiswa (Nama, NIM, Kelas),
/// serta widget tambahan berupa [Icon] dan [ElevatedButton] interaktif yang
/// mendemonstrasikan prinsip reaktif `UI = f(state)` pada Flutter.
class HomeScreen extends StatefulWidget {
  /// Membuat instance [HomeScreen].
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Data statis identitas mahasiswa sesuai Tugas Rutin 1.
  static const StudentProfile _student = StudentProfile(
    name: 'Muhammad Gali Almahdi',
    nim: '4243250042',
    className: 'PSIK24D',
  );

  /// State penghitung jumlah klik tombol sapaan.
  int _greetingCount = 0;

  /// Fungsi untuk memperbarui state ketika [ElevatedButton] ditekan.
  void _handleGreetingPressed() {
    setState(() {
      _greetingCount++;
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Halo dari ${_student.name} (${_student.nim})! '
          'Tombol telah ditekan $_greetingCount kali.',
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flutter_dash_rounded),
            SizedBox(width: 8),
            Text(
              'Pertemuan 1 - Hello World',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header Hello World
                  Icon(
                    Icons.waving_hand_rounded,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Hello World, Flutter!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tugas Rutin 1 · Pemrograman Mobile',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 24),

                  // Kartu Identitas Mahasiswa (Nama, NIM, Kelas)
                  const ProfileCard(profile: _student),
                  const SizedBox(height: 24),

                  // Widget tambahan: ElevatedButton dengan Icon
                  ElevatedButton.icon(
                    onPressed: _handleGreetingPressed,
                    icon: const Icon(Icons.celebration_rounded),
                    label: Text(
                      _greetingCount == 0
                          ? 'Kirim Sapaan'
                          : 'Sapaan Terkirim ($_greetingCount)',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
