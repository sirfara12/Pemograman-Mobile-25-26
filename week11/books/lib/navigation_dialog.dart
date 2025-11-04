import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  void _showColorDialog(BuildContext context) async {
    final Color? newColor = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Kuning'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 223, 186, 55));
              },
            ),
            TextButton(
              child: const Text('Hijau'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 57, 196, 124));
              },
            ),
            TextButton(
              child: const Text('Biru'),
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 25, 136, 210));
              },
            ),
          ],
        );
      },
    );
    if (newColor != null) {
      setState(() {
        color = newColor; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text(
          'Sirfara - Navigation Dialog Screen', 
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, 
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }
}