import 'package:flutter/material.dart';
import 'stream.dart'; // Mengandung NumberStream dan ColorStream
import 'dart:async'; // Diperlukan untuk Stream (Langkah 6)
import 'dart:math'; // Diperlukan untuk Random (Langkah 6)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Sirfara',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // --- Variabel untuk ColorStream (Tugas sebelumnya) ---
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  late StreamSubscription _colorSubscription; // Tambahan untuk cleanup ColorStream

  // --- Variabel untuk NumberStream (Langkah 7) ---
  int lastNumber = 0;
  late StreamController numberStreamController; // Perlu diganti dengan tipe generik
  late NumberStream numberStream;

  // --- Implementasi initState (Langkah 8 & ColorStream) ---
  @override
  void initState() {
    super.initState();
      colorStream = ColorStream();
    _colorSubscription = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });

    super.initState();
  }

  // --- Method changeColor (Tidak dipakai lagi, sudah diintegrasikan ke initState) ---
  /* void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
  */

  // --- Method addRandomNumber (Langkah 10) ---
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // Angka acak dari 0 hingga 9
    numberStream.addNumberToSink(myNum); // Mengirim angka ke NumberStream
  }

  // --- Implementasi dispose (Langkah 9 & ColorStream) ---
  @override
  void dispose() {
    numberStreamController.close();
    _colorSubscription.cancel();
    
    super.dispose();
  }

  // --- Implementasi build (Langkah 11) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                lastNumber.toString(),
                style: const TextStyle(fontSize: 48, color: Colors.white),
              ),
              
              ElevatedButton(
                onPressed: addRandomNumber,
                child: const Text('New Random Number'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}