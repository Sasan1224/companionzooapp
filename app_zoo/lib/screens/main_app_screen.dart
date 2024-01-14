import 'package:app_zoo/screens/album_screen.dart';
import 'package:app_zoo/screens/camara_screen.dart';
import 'package:app_zoo/screens/historias_sceen.dart';
import 'package:app_zoo/screens/qr_scanner_screen.dart';
import 'package:app_zoo/screens/trivia_start_screen.dart';
import 'package:app_zoo/widgets/clickleable_container_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatelessWidget {
  MainAppScreen({super.key});
  final List<String> imageList = [
    'assets/1Z.JPG',
    'assets/2Z.JPG',
    'assets/3Z.JPG',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrusel de Imágenes'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Expanded(
            child: MyClickableContainer(
          color: Colors.amber,
          icon: Icons.menu_book,
          text: "Historias",
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoriasScreen()));},
        )),
        Expanded(
            child: MyClickableContainer(
          color: Colors.green,
          icon: Icons.photo_camera,
          text: "Cámara",
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrScreen()));},

        )),
        Expanded(
            child: MyClickableContainer(
          color: Colors.red,
          icon: Icons.emoji_objects,
          text: "Trivia",
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TriviaStartScreen()));},
        )),
        Expanded(
            child: MyClickableContainer(
          color: Colors.blue,
          icon: Icons.photo_album,
          text: "Álbum",
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AlbumScreen()));},
        )),
      ]),
    );
  }
}
