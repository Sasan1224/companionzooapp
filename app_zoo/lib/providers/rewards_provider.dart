class _RewardProvider{
  int puntos;

  _RewardProvider({required this.puntos});

  set setPuntaje(int valor){
    if (valor>=0){
      puntos= valor;
    }
  }

  int get getPuntaje => puntos;

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