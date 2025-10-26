import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'takepicture_screen.dart';

class HomePage extends StatelessWidget {
  final CameraDescription? camera;

  const HomePage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: camera == null
              ? null
              : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TakePictureScreen(camera: camera!),
                    ),
                  );
                },
          child: const Text('Open Camera'),
        ),
      ),
    );
  }
}