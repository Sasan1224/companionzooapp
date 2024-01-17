import 'package:app_zoo/modelo/event.dart';

class _EventProvider{

  final List<Event> _eventos = [
    Event(
      imagePath: "assets/zoocali.jpg", 
      hora: "2:00 PM", 
      titulo: "Charla sobre animales.", 
      descripcion: "Este evento educativo y enriquecedor te invita a explorar el maravilloso mundo de los animales. Expertos en vida silvestre compartirán conocimientos y experiencias únicas sobre diversas especies, sus hábitats, comportamientos y la importancia de su conservación. Es una oportunidad perfecta para aprender, interactuar y comprometerse con la protección de la fauna mundial. ¡No te pierdas esta aventura en el reino animal!"),

    Event(
      imagePath: "assets/bear.jpg", 
      hora: "3:00 PM", 
      titulo: "Alimentacion del Oso de anteojos.", 
      descripcion: "Participa en una experiencia interactiva donde aprenderás sobre las dietas específicas, necesidades nutricionales y métodos de alimentación para mantener saludables a estos increíbles animales. Los expertos en vida silvestre te guiarán a través de las prácticas de cuidado y te mostrarán cómo se preparan y suministran sus alimentos. ¡Ven y descubre los secretos detrás de la nutrición de uno de los mamíferos más emblemáticos!"),

    Event(
      imagePath: "assets/tigers.jpeg", 
      hora: "4:00 PM", 
      titulo: "Charla inaguración nuevo recinto Tigres.", 
      descripcion: "Te invitamos a la gran apertura de nuestro nuevo recinto de tigres, un espacio diseñado meticulosamente para replicar el hábitat natural de estos majestuosos felinos. Este evento memorable incluirá un recorrido por las nuevas instalaciones, charlas educativas sobre la vida y conservación de los tigres, y la oportunidad única de ver de cerca a estos impresionantes animales."),
  ];

  List<Event> get eventos => _eventos;

}

final eventProvider = _EventProvider();