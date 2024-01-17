import 'package:app_zoo/modelo/reward.dart';
import 'package:app_zoo/providers/rewards_provider.dart';
import 'package:app_zoo/widgets/image_placeholder.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _puntos = rewardProvider.getPuntaje;

  final List<Reward> _recompensas = rewardProvider.getRecompensas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recompensas'),
      ),
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
                    backgroundColor: Colors.blue, 
                  ),
                  onPressed: () => _validateReward(recompensa: recompensa, context: context),
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

  void _validateReward({required Reward recompensa, required BuildContext context}) {
    if (_puntos >= recompensa.points && recompensa.isAvailable()) {
      recompensa.claimReward();
      rewardProvider.subPoints(recompensa.points);
      setState(() {
        _puntos = rewardProvider.getPuntaje;
      });
      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Recompensa reclamada satisfactoriamente')),
                    );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No se pudo reclamar la recompensa.')),
                    );
    }
  }
}


