import 'package:app_zoo/modelo/historia.dart';
import 'package:app_zoo/providers/historia_provider.dart';
import 'package:app_zoo/screens/historias_detail_screen.dart';
import 'package:app_zoo/widgets/image_with_button.dart';
import 'package:flutter/material.dart';

class HistoriasScreen extends StatelessWidget {
  const HistoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Historias")),
      body: SingleChildScrollView(
      child: Column(
        children: [
          ImageWithButton(imagePath: "assets/R1.png",buttonText: "Ver Historia", onPressed: (){
            Historia?  historia = historiaProvider.getHistoriaFromID(0);
            if(historia != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoriasDetailScreen(historia: historia)));
            }
          },),

          ImageWithButton(imagePath: "assets/R1.png",buttonText: "Ver Historia", onPressed: (){
            Historia?  historia = historiaProvider.getHistoriaFromID(1);
            if(historia != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoriasDetailScreen(historia: historia)));
            }
          },)
        ],
      ),
      ),
    );
  }
}
