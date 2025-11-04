import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sirfara - Navigation Second Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('pink'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 216, 39, 181);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('hijau'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 97, 188, 36);
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('kuning'),
              onPressed: () {
                Color color = const Color.fromARGB(255, 173, 210, 25);
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}