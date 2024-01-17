import 'package:app_zoo/modelo/event.dart';
import 'package:app_zoo/providers/event_provider.dart';
import 'package:app_zoo/screens/event_info_screen.dart';
import 'package:app_zoo/widgets/my_card.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  
  final eventos = eventProvider.eventos;
  
  EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eventos")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(Event evento in eventos) ...[
              MyCard(
                imagePath: evento.imagePath, 
                title: "Evento", 
                subTitle: evento.titulo, 
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventInfoScreen(evento: evento)));}),

            ],
          ],
        ),
      ),
    );
  }
}




