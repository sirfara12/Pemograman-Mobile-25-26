import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Pasuruan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ⭐⭐ Rating + teks
  final ratings = Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.star, color: Colors.green),
            Icon(Icons.star, color: Colors.green),
            Icon(Icons.star, color: Colors.green),
            Icon(Icons.star, color: Colors.black),
            Icon(Icons.star, color: Colors.black),
          ],
        ),
        const Text(
          '170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Pasuruan'), centerTitle: true),
      body: ListView(
        children: [
          // 📷 Gambar header
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/image/alunalun.png',
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          // 📌 Info utama
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kiri: teks
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alun-Alun Pasuruan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Alun-Alun Pasuruan adalah ruang publik utama di kota Pasuruan. '
                        'Tempat ini sering digunakan warga untuk bersantai, olahraga ringan, '
                        'serta wisata kuliner.',
                        softWrap: true,
                      ),
                      const SizedBox(height: 12),

                      ratings,

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          InfoColumn(icon: Icons.access_time, label: '24 Jam'),
                          InfoColumn(icon: Icons.location_on, label: 'Pasuruan'),
                          InfoColumn(icon: Icons.park, label: 'Ruang Publik'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/image/alunalun.png',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Wisata Sekitar Pasuruan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: GalleryItem(
                    image: 'assets/image/banyubiru.png',
                    title: 'Banyu Biru',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GalleryItem(
                    image: 'assets/image/umbulan.jpg',
                    title: 'Umbulan',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GalleryItem(
                    image: 'assets/image/ranu.jpg',
                    title: 'Danau Ranu',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Hiburan & Kuliner',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),
          ..._buildListTiles(),
        ],
      ),
    );
  }
}

// 🔹 Widget kecil Info
class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  const InfoColumn({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// 🔹 Widget galeri
class GalleryItem extends StatelessWidget {
  final String image;
  final String title;
  const GalleryItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, fit: BoxFit.cover, height: 100),
        ),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}

// 🔹 Daftar list hiburan & kuliner
List<Widget> _buildListTiles() {
  return [
    _tile('Saygon Night Park, Taman Dayu Waterpar', 'Wahana malam & permainan', Icons.attractions),
    _tile('Taman Dayu Waterpark', 'Wahana air & outbound', Icons.pool),
    _tile('Air Terjun Putuk Truno', 'Wisata alam pegunungan', Icons.landscape),
    _tile('Hutan Mangrove Pasuruan', 'Wisata edukasi pesisir', Icons.forest),
    _tile('Ranu Grati', 'Danau alami di Pasuruan', Icons.water),
    _tile('Stadion R. Soedarsono', 'Arena olahraga & event', Icons.sports_soccer),
    _tile('Pekan Raya Pasuruan', 'Festival & hiburan rakyat', Icons.event),
    _tile('Alun-alun Pasuruan', 'Ruang publik utama kota', Icons.location_city),

  const Divider(
      thickness: 2,
      height: 32,
      color: Colors.grey,
    ),

    _tile('Soto Pasuruan', 'Kuah segar dengan ayam/sapi', Icons.ramen_dining),
    _tile('Rawon', 'Sup daging khas Jawa Timur', Icons.rice_bowl),
    _tile('Nasi Punel', 'Nasi khas Pasuruan dengan lauk lengkap', Icons.restaurant),
    _tile('Sate Kambing', 'Olahan daging kambing bakar', Icons.local_dining),
    _tile('Kupang Kraton', 'Olahan kerang kupang khas pesisir', Icons.set_meal),
    _tile('Ledre', 'Camilan tipis manis dari pisang', Icons.fastfood),
    _tile('Tape Ketan', 'Fermentasi ketan manis legit', Icons.cake),
    _tile('Wedang Angsle', 'Minuman hangat khas Jawa Timur', Icons.local_cafe),
  ];
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    ),
    subtitle: Text(subtitle),
    leading: Icon(icon, color: Colors.blue[500]),
  );
}
