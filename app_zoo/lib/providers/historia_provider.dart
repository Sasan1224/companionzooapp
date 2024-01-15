import 'package:app_zoo/modelo/historia.dart';

class _HistoriaProvider{

  List<Historia> historias = [
    Historia(
      id: 0, 
      imageList: [
        "assets/historias/H (1).jpg",
        "assets/historias/H (2).jpg",
        "assets/historias/H (3).jpg",
        ]
      ),
    Historia(
      id: 1, 
      imageList: [
        "assets/historias/H (4).jpg",
        "assets/historias/H (5).jpg",
        "assets/historias/H (6).jpg",
        ]
      ),
  ];

  
  Historia? getHistoriaFromID(int id){
    for(Historia historia in historias){
      if (historia.id == id){
        return historia;
      }
    }
    return null;
  }

}

final historiaProvider = _HistoriaProvider();