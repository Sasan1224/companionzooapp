import 'package:app_zoo/modelo/historia.dart';
import 'package:app_zoo/providers/historia_provider.dart';
import 'package:app_zoo/screens/historias_detail_screen.dart';
import 'package:app_zoo/widgets/image_with_button.dart';
import 'package:flutter/material.dart';

class HistoriasScreen extends StatelessWidget {

  final historias = historiaProvider.historias;

  HistoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historias")),
      body: SingleChildScrollView(
      child: Column(
        children: [
          for(Historia historia in historias) ...[
            ImageWithButton(imagePath: historia.imagenDePortada,buttonText: "Ver Historia", onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoriasDetailScreen(historia: historia)));},
            ),
          ],
        ],
      ),
      ),
    );
  }
}
