/// Model data untuk menyimpan informasi identitas mahasiswa.
///
/// Kelas ini bersifat immutable (menggunakan `final` dan konstruktor `const`)
/// sesuai dengan best practice pengembangan aplikasi Flutter.
class StudentProfile {
  /// Nama lengkap mahasiswa.
  final String name;

  /// Nomor Induk Mahasiswa (NIM).
  final String nim;

  /// Kelas mahasiswa pada mata kuliah Pemrograman Mobile.
  final String className;

  /// Nama mata kuliah yang sedang ditempuh.
  final String course;

  /// Nama perguruan tinggi/universitas.
  final String university;

  /// Membuat instance [StudentProfile] dengan parameter wajib.
  const StudentProfile({
    required this.name,
    required this.nim,
    required this.className,
    this.course = 'Pemrograman Mobile',
    this.university = 'Universitas Negeri Medan (UNIMED)',
  });
}
