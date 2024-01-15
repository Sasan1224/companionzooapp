import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;

  const ImagePlaceholder({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 200, // Define una altura fija para la imagen
          child: Center(child: Image.asset(imagePath))),
    );
  }
}