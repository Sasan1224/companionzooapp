import 'package:app_zoo/modelo/pregunta.dart';
import 'package:app_zoo/providers/rewards_provider.dart';
import 'package:app_zoo/screens/trivia_start_screen.dart';
import 'package:app_zoo/widgets/clickleable_container_widget.dart';
import 'package:flutter/material.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int currentQuestionIndex = 0;
  int puntosObtenidos = 0;
  List<Pregunta> questions = [
    Pregunta(
        id: 0,
        pregunta:
            "¿En qué tipo de hábitat acuático se encuentra comúnmente la anguila?",
        optionList: [
          "Océano Atlántico",
          "Agua salada de mar",
          "Rios de agua dulce",
          "Estuarios de agua salobre"
        ],
        correctIndex: 3, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMidzW31Fd4q6eOVh41aSdc5saoJPMxUWB0csobiNbk6XHDuJ9AaWwEqKrCFE-dSv8TjI&usqp=CAU"),
    Pregunta(
        id: 0,
        pregunta: "¿El Tetra Neón es un pez cuya dieta es completamente carnivora o herbívora?",
        optionList: [
          "Carnívora",
          "Omnívora",
          "Hebívora",
          "Insectívora"
        ],
        correctIndex: 1, imageUrl: "https://laguiadelacuario.es/wp-content/uploads/2020/05/acuariotetras_pda.jpg"),
    Pregunta(
        id: 0,
        pregunta: "¿Cuál de los siguientes peces suele ser un poco agresivo y territorial a la hora de cuidar su habitat en los arrecifes?",
        optionList: [
          "Guppy",
          "Pez Payaso",
          "Cirujano amarillo",
          "Bagre"
        ],
        correctIndex: 2, imageUrl: "https://cdn0.bioenciclopedia.com/es/posts/1/7/1/pez_payaso_171_orig.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trivia")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.network(
              questions[currentQuestionIndex].imageUrl,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                questions[currentQuestionIndex].pregunta,
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20.0),
            ...List.generate(
              questions[currentQuestionIndex].optionList.length,
              (index) => Expanded(
                  child: MyClickableContainer(
                color: Colors.blue,
                icon: Icons.question_mark,
                text: questions[currentQuestionIndex].optionList[index],
                onTap: () => _handleAnswer(index, context),
              )),

              /*Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    handleAnswer(index);
                  },
                  child: Text(questions[currentQuestionIndex].optionList[index]),
                ),
              ),*/
            ),
          ],
        ),
      ),
    );
  }

  void _handleAnswer(int selectedOptionIndex, BuildContext context) {
    if (selectedOptionIndex == questions[currentQuestionIndex].correctIndex) {
      // Lógica para manejar una respuesta correcta
      puntosObtenidos += 200;
    }

    // Avanzar a la siguiente pregunta o hacer algo más según tus necesidades
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Fin del cuestionario, puedes mostrar un mensaje o volver al inicio, etc.
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            contentPadding: const EdgeInsets.all(16.0),
            title: const Text("Fin de la trivia"),
            content: Container(
              child: Text("Tus puntos obtenidos: $puntosObtenidos"),
            ),
            actions: [
              ElevatedButton(
                onPressed: (){
                  rewardProvider.addPoints(puntosObtenidos);
                  Navigator.of(context).pop(); // Cerrar el diálogo
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const TriviaStartScreen()));
                }, 
                child: const Text("Aceptar")),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(); // Cerrar el diálogo
                  _reiniciarTrivia();
                }, 
                child: const Text("Reiniciar"))
            ],
          );
        });
      }
    });
  }

  void _reiniciarTrivia() {
    setState(() {
      currentQuestionIndex = 0;
      puntosObtenidos = 0;
    });
  }
}
