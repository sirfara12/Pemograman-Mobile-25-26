import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widges/takepicture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera yang tersedia di device
  final cameras = await availableCameras();

  // Gunakan kamera pertama (biasanya kamera belakang)
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}
