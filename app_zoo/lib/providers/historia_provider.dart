import 'package:app_zoo/modelo/historia.dart';

class _HistoriaProvider{

  final List<Historia> _historias = [
    Historia(
      imagenDePortada: "assets/historias/amzn.png",
      imageList: [
        "assets/historias/1.png",
        "assets/historias/2.png",
        "assets/historias/3.png",
        "assets/historias/4.png",
        "assets/historias/5.png",
        ]
      ),
      Historia(
      imagenDePortada: "assets/historias/fnts.png",
      imageList: [
        "assets/historias/1.png",
        "assets/historias/2.png",
        "assets/historias/3.png",
        "assets/historias/4.png",
        "assets/historias/5.png",
        ]
      ),
      Historia(
      imagenDePortada: "assets/historias/asia.png",
      imageList: [
        "assets/historias/1.png",
        "assets/historias/2.png",
        "assets/historias/3.png",
        "assets/historias/4.png",
        "assets/historias/5.png",
        ]
      ),
  ];

  List<Historia> get historias => _historias;

  
  Historia? getHistoriaFromIndex(int index){
    
    if (index >= 0 && index <historias.length){
      return historias[index];
    }
    return null;
  }

}

final historiaProvider = _HistoriaProvider();