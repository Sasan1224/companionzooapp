import 'package:app_zoo/modelo/reward.dart';

class _RewardProvider{
  int puntos;
  final List<Reward> _recompensas = [
    Reward(imagePath: "assets/R1.png", points: 200),
    Reward(imagePath: "assets/R2.png", points: 500),
    Reward(imagePath: "assets/R3.png", points: 1000),
    Reward(imagePath: "assets/R4.png", points: 2000),
  ];

  _RewardProvider({required this.puntos});

  set setPuntaje(int valor){
    if (valor>=0){
      puntos= valor;
    }
  }

  int get getPuntaje => puntos;

  List<Reward> get getRecompensas => _recompensas;
  
  void addPoints(int cantidad){
    if(cantidad>0){
      puntos+=cantidad;
    }
  }

  void subPoints(int cantidad){
    if (cantidad>0){
      puntos-=cantidad;
    }
  }


}

final rewardProvider = _RewardProvider(puntos: 0);