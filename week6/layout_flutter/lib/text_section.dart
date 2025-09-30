import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Saat ini penampakan Alun-Alun Kota Pasuruan kini semakin cantik dengan penambahan payung Madinah di depan masjid Jami’ Al Anwar. '
        'Pemerintah Kota Pasuruan terus berupaya memperindah Alun-Alun Kota Pasuruan untuk memberikan suasana yang nyaman dan aman bagi semua kalangan masyarakat.'
        'Keindahan Alun-Alun semakin lengkap dengan kehadiran 12 Payung Madinah di depan masjid Jami’ Al Anwar dan ketika di malam hari, para wisatawan dapat menikmati gemerlap lampu yang dipancarkan di Tugu Alun-Alun.'
      ),
    );
  }
}
