
class Pregunta{
  String pregunta;
  List<String> optionList;
  int correctIndex;
  String imageUrl;

  Pregunta({required this.pregunta, required this.optionList, required this.correctIndex,required this.imageUrl});

  bool verify(int opcion){
    return opcion == correctIndex;
  }
}
