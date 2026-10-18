import 'package:flutter/material.dart';
import '../models/student_profile.dart';

/// Widget kartu profil yang menampilkan identitas lengkap mahasiswa.
///
/// Menggunakan komponen Material 3 seperti [Card], [ListTile], dan [Icon]
/// untuk menyajikan Nama, NIM, dan Kelas secara rapi dan mudah dibaca.
class ProfileCard extends StatelessWidget {
  /// Data profil mahasiswa yang akan ditampilkan pada kartu.
  final StudentProfile profile;

  /// Membuat widget [ProfileCard].
  const ProfileCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar dengan widget tambahan Icon
            CircleAvatar(
              radius: 36,
              backgroundColor: colorScheme.primaryContainer,
              child: Icon(
                Icons.person_rounded,
                size: 42,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Identitas Mahasiswa',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const Divider(height: 24),
            _buildInfoRow(
              context,
              icon: Icons.badge_outlined,
              label: 'Nama',
              value: profile.name,
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              context,
              icon: Icons.numbers_rounded,
              label: 'NIM',
              value: profile.nim,
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              context,
              icon: Icons.class_outlined,
              label: 'Kelas',
              value: profile.className,
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              context,
              icon: Icons.school_outlined,
              label: 'Institusi',
              value: profile.university,
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method untuk membangun baris informasi dengan [Icon], label, dan nilai.
  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 22,
          color: colorScheme.primary,
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 75,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        const Text(
          ': ',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
