import 'package:app_zoo/widgets/image_placeholder.dart';
import 'package:flutter/material.dart';

class ImageWithButton extends StatelessWidget {
  
  final String buttonText;
  final String imagePath;
  final VoidCallback onPressed;
  
  const ImageWithButton({
    super.key, 
    required this.buttonText, 
    required this.imagePath, 
    required this.onPressed}
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        ImagePlaceholder(imagePath: imagePath),
        Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color de fondo del botón
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
      ],)
    );
  }
}

