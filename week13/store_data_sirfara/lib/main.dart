import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecureStorageUIExample(),
    );
  }
}

class SecureStorageUIExample extends StatefulWidget {
  @override
  _SecureStorageUIExampleState createState() => _SecureStorageUIExampleState();
}

class _SecureStorageUIExampleState extends State<SecureStorageUIExample> {
  final storage = const FlutterSecureStorage();
  final TextEditingController controller = TextEditingController();

  String readValue = "";

  Future<void> saveValue() async {
    await storage.write(key: "secret", value: controller.text);
  }

  Future<void> readStoredValue() async {
    String? value = await storage.read(key: "secret");
    setState(() {
      readValue = value ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    const pink = Colors.pink;

    return Scaffold(
      appBar: AppBar(
        title: Text("Path Provider"),
        backgroundColor: pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Masukkan data",
                labelStyle: TextStyle(color: pink),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: pink, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: pink),
                ),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 2,
              color: pink,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pink,
                foregroundColor: Colors.white,
              ),
              onPressed: saveValue,
              child: Text("Save Value"),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pink,
                foregroundColor: Colors.white,
              ),
              onPressed: readStoredValue,
              child: Text("Read Value"),
            ),

            SizedBox(height: 20),

            Text(
              readValue,
              style: TextStyle(fontSize: 18, color: pink),
            ),
          ],
        ),
      ),
    );
  }
}
