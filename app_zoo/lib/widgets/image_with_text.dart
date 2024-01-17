import 'package:flutter/material.dart';

class ImageWithText extends StatelessWidget {
  
  final String imagePath;
  final String text;

  const ImageWithText({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
        SizedBox(
            height: 200,
            child: Center(child: Image.asset(imagePath))),
          Positioned(
            bottom: 16.0, 
            left: 30.0, 
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}