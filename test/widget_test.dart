import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_pertemuan_01_4243250042/main.dart';

void main() {
  testWidgets(
    'Menampilkan identitas mahasiswa (Nama, NIM, Kelas) dan widget tambahan',
    (WidgetTester tester) async {
      // Membangun aplikasi HelloWorldApp dan memicu frame pertama.
      await tester.pumpWidget(const HelloWorldApp());

      // Memastikan teks Hello World serta Nama, NIM, dan Kelas tampil di layar.
      expect(find.text('Hello World, Flutter!'), findsOneWidget);
      expect(find.text('Muhammad Gali Almahdi'), findsOneWidget);
      expect(find.text('4243250042'), findsOneWidget);
      expect(find.text('PSIK24D'), findsOneWidget);

      // Memastikan widget tambahan Icon dan ElevatedButton tampil.
      expect(find.byIcon(Icons.person_rounded), findsOneWidget);
      expect(find.text('Kirim Sapaan'), findsOneWidget);

      // Menekan ElevatedButton dan memastikan state bertambah (UI = f(state)).
      final buttonFinder = find.text('Kirim Sapaan');
      await tester.ensureVisible(buttonFinder);
      await tester.pumpAndSettle();
      await tester.tap(buttonFinder);
      await tester.pump();

      expect(find.text('Sapaan Terkirim (1)'), findsOneWidget);
    },
  );
}
