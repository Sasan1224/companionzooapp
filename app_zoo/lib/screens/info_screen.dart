import 'package:app_zoo/modelo/animal_info.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimalInfoScreen extends StatelessWidget {

  final AnimalInfo animal;

  const AnimalInfoScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
  final List<String> imageList = animal.imageList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        title: Text(animal.nombre),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              child: Text(
                'Conoce más sobre ${animal.nombre}',
                style: const TextStyle(
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
              child: Text(
                animal.descripcionAnimal,
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
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
              child: Text(
                animal.descripcionHabitat,
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: const Text(
                'Comportamiento',
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
              child: Text(
                animal.descripcionComportamiento,
                style: const TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: const Text(
                'Alimentación',
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
              child: Text(
                animal.descripcionAlimentacion,
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
