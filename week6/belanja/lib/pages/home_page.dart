import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widges/item_card.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item('Beras', 12000, 'assets/image/beras.jpeg', 'Beras premium kualitas terbaik'),
    Item('Gula', 5000, 'assets/image/gula.jpg', 'Gula manis alami'),
    Item('Minyak', 14000, 'assets/image/minyak.jpg', 'Minyak goreng 1 liter'),
    Item('Telur', 22000, 'assets/image/telur.jpeg', 'Telur ayam kampung segar'),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ItemCard(item: items[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue[100],
            child: const Text(
              "Nama: Sirfaratih | NIM: 2341720072",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
