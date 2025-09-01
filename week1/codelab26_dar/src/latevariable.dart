void main() {
  late String pesan; // Ditunda inisialisasinya

  // Kalau langsung dipanggil -> ERROR runtime
  // print(pesan);

  //  diinisialisasi
  pesan = "Halo, ini menggunakan late!";
  print("Pesan: $pesan");
}
