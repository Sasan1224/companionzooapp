import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final String imagePath;
  final String title;
  final String subTitle;
  VoidCallback onTap;

  MyCard({super.key, required this.imagePath, required this.title, required this.subTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                imagePath, // Reemplaza con la URL de tu imagen
                height: 150, // Ajusta la altura de la imagen según tus necesidades
                width: double.infinity, // La imagen ocupa todo el ancho del Card
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio asignado
              ),
            ),
            ListTile(
              title: Text(title),
              subtitle: Text(subTitle),
            ),
          ],
        ),
      ),
    );
  }
}