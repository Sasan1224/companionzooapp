import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimalInfo extends StatelessWidget {
  AnimalInfo({super.key});
  final List<String> imageList = [
    'assets/eel1.png',
    'assets/eel2.png',
    'assets/eel3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        title: const Text('Anguila Eléctrica'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imageList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          // Título en el rectángulo azul
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: const Text(
              'Conoce más sobre la Anguila Eléctrica',
              style: TextStyle(
                color: Color.fromARGB(255, 47, 46, 46),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Espacio de texto en el rectángulo rojo
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: const Text(
              'La anguila eléctrica es conocida por su capacidad de generar potentes descargas eléctricas. Aquí puedes encontrar más información sobre sus hábitats, comportamiento y más.',
              style: TextStyle(
                color: const Color.fromARGB(255, 47, 46, 46),
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: const Text(
              'Habitat',
              style: TextStyle(
                color: Color.fromARGB(255, 47, 46, 46),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Espacio de texto en el rectángulo rojo
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            child: const Text(
              'La anguila eléctrica se encuentra en aguas salobres',
              style: TextStyle(
                color: const Color.fromARGB(255, 47, 46, 46),
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
