import 'package:flutter/material.dart';
import 'dart:io';
import 'filter_carousel.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture with Filter - 2341720072')),
      body: PhotoFilterCarousel(imagePath: imagePath),
    );
  }
}
