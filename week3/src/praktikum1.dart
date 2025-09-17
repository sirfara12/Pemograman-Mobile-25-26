void main() {
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  // Langkah 3
  final List<String?> myList = List.filled(5, null);

  myList[1] = "Sirfara";
  myList[2] = "2341720072";

  print(myList);
}