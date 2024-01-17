import 'package:app_zoo/modelo/event.dart';
import 'package:flutter/material.dart';

class EventInfoScreen extends StatelessWidget {
  
  final Event evento;
  
  const EventInfoScreen({super.key, required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        title: const Text("Información del Evento"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                evento.imagePath, 
                height: 200, 
                width: double.infinity, // width del tamaño de Card
                fit: BoxFit.cover, // Ajusta de imagen Box
              ),
            ),
            // Título 
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                evento.titulo,
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                "Hora: ${evento.hora}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text(
                evento.descripcion,
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}