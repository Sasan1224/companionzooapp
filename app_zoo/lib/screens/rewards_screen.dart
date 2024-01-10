import 'package:app_zoo/modelo/reward.dart';
import 'package:app_zoo/providers/rewards_provider.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _puntos = rewardProvider.getPuntaje;

  final List<Reward> _recompensas = [
    Reward(imagePath: "assets/R1.png", points: 500),
    Reward(imagePath: "assets/R1.png", points: 200),
    Reward(imagePath: "assets/R1.png", points: 1000),
    Reward(imagePath: "assets/R1.png", points: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recompensas'),
      ),
      // Envuelve el Column en un SingleChildScrollView para habilitar el desplazamiento
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text("Puntos: $_puntos",
                        style: const TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            for (Reward recompensa in _recompensas) ...[
              ImagePlaceholder(imagePath: recompensa.imagePath),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Color de fondo del botón
                  ),
                  onPressed: () => _validateReward(recompensa: recompensa),
                  child: Text(
                    'Reclamar: ${recompensa.points}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _validateReward({required Reward recompensa}) {
    if (_puntos >= recompensa.points && recompensa.isAvailable()) {
      print("Reclamada");
      recompensa.claimReward();
      rewardProvider.subPoints(recompensa.points);
      setState(() {
        _puntos = rewardProvider.getPuntaje;
      });
    } else {
      print("No se puede reclamar la recompensa");
    }
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;

  const ImagePlaceholder({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 200, // Define una altura fija para la imagen
          child: Center(child: Image.asset(imagePath))),
    );
  }
}

class ButtonPlaceholder extends StatelessWidget {
  final int necessaryPoints;

  const ButtonPlaceholder({super.key, required this.necessaryPoints});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Color de fondo del botón
        ),
        onPressed: () {
          print("Reclamada");
        },
        child: Text(
          'Reclamar: $necessaryPoints',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
