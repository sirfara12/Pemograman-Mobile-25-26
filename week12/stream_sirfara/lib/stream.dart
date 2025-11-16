import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pinkAccent,   // Warna pink yang lebih cerah
    Colors.lime,         // Hijau kekuningan
    Colors.cyan,         // Biru kehijauan
    Colors.brown,        // Cokelat
    Colors.deepOrange,   // Oranye tua
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
    });
  }
}