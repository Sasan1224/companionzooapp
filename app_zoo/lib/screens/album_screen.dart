import 'package:app_zoo/widgets/image_with_text.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eventos")),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ImageWithText(imagePath: "assets/R1.png", text: "Evento: Charla sobre animales."),
            ImageWithText(imagePath: "assets/R1.png", text: "Evento: Charla sobre animales."),
            ImageWithText(imagePath: "assets/R1.png", text: "Evento: Charla sobre animales."),
            ImageWithText(imagePath: "assets/R1.png", text: "Evento: Charla sobre animales."),
          ],
        ),
      ),
    );
  }
}
