import 'package:app_zoo/screens/rewards_screen.dart';
import 'package:app_zoo/screens/trivia_screen.dart';
import 'package:flutter/material.dart';


class TriviaStartScreen extends StatelessWidget {
  const TriviaStartScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Trivia")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/applogo.png'), 
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // Color de fondo
                foregroundColor: Colors.white, // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TriviaScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Text('Comenzar Trivia'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // Color de fondo
                foregroundColor: Colors.white, // Color del texto
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RewardsScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Text('Recompensas'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
