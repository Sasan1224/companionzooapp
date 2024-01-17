class Event{

  String imagePath;
  String hora;
  String titulo;
  String descripcion;

  Event({
    required this.imagePath,
    required this.hora,
    required this.titulo,
    required this.descripcion,
    });

  Event copy() => Event(
    imagePath: imagePath, 
    hora: hora, 
    titulo: titulo, 
    descripcion: descripcion); 
 
}