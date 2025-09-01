void main() {
  // Variabel non-nullable, harus langsung ada nilai
  String nama = "Sirfara";
  print("Nama: $nama");

  // Variabel nullable, bisa null
  String? alamat;
  print("Alamat: $alamat"); // null

  // Menggunakan operator ?? untuk default value
  print("Alamat (default): ${alamat ?? 'Belum diisi'}");

  // Mengisi nilai kemudian
  alamat = "pasuruan";
  print("Alamat setelah diisi: $alamat");
}
