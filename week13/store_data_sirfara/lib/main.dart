import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PathProviderExample(),
    );
  }
}

class PathProviderExample extends StatefulWidget {
  @override
  _PathProviderExampleState createState() => _PathProviderExampleState();
}

class _PathProviderExampleState extends State<PathProviderExample> {
  late File myFile;
  String fileContent = "";

  @override
  void initState() {
    super.initState();
    initFile();
  }

  Future<void> initFile() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      String fullPath = "${dir.path}/mydata.txt";
      myFile = File(fullPath);

      // Tulis isi file
      await writeFile();
    } catch (e) {
      print("Error init file: $e");
    }
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString("Sirfaratih, 2341720072");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> readFile() async {
    try {
      String text = await myFile.readAsString();
      setState(() {
        fileContent = text;
      });
    } catch (e) {
      setState(() {
        fileContent = "Gagal membaca file!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Path Provider"),
        backgroundColor: Colors.pink,       // **WARNA PINK**
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: readFile,
                child: Text("Read File"),
              ),

              SizedBox(height: 40),

              Text(
                fileContent,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
