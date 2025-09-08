void main() {
  String nama = "Sirfaratih";
  String nim = "2341720072";

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima -> $nama ($nim)");
    }
  }
}

bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
