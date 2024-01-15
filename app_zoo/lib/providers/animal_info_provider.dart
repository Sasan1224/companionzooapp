import 'package:app_zoo/modelo/animal_info.dart';

class _AnimalInfoProvider {
  List<AnimalInfo> animales = [
    AnimalInfo(
      identificadorQR: "electricEel",
      imageList: [
        'assets/eel1.png',
        'assets/eel2.png',
        'assets/eel3.png',
      ],
      nombre: "Anguila eléctrica",
      descripcionAnimal:
          "La anguila eléctrica es conocida por su capacidad de generar potentes descargas eléctricas. Aquí puedes encontrar más información sobre sus hábitats, comportamiento y más.",
      descripcionHabitat: "La anguila eléctrica se encuentra en aguas salobres",
      descripcionComportamiento:
          "La anguila eléctrica exhibe comportamientos fascinantes, como la generación de campos eléctricos para cazar presas y defenderse de depredadores. Son activas principalmente durante la noche.",
      descripcionAlimentacion:
          "La anguila eléctrica es carnívora y se alimenta de peces pequeños y otros organismos acuáticos. Utiliza sus descargas eléctricas para aturdir a las presas antes de capturarlas.",
    ),
    AnimalInfo(
      identificadorQR: "catfish",
      imageList: [
        'assets/b1.jpg',
        'assets/b2.jpg',
        'assets/b3.jpg',
      ],
      nombre: "Bagre",
      descripcionAnimal:
          "El bagre es un pez de agua dulce conocido por sus barbas sensitivas en la cabeza, llamadas barbillones. Son excelentes depredadores y pueden adaptarse a una variedad de entornos acuáticos.",
      descripcionHabitat:
          "Los bagres se encuentran comúnmente en ríos y lagos de agua dulce.",
      descripcionComportamiento:
          "Los bagres son nocturnos y suelen buscar alimento durante la noche. Utilizan sus barbillones para detectar presas en el fondo del agua.",
      descripcionAlimentacion:
          "La alimentación del bagre varía, pero comúnmente se alimentan de otros peces, insectos, crustáceos y materia orgánica en el lecho del río.",
    ),
    AnimalInfo(
      identificadorQR: "hatchetfish",
      imageList: [
        'assets/ht1.jpg',
        'assets/ht2.jpg',
        'assets/ht3.jpg',
      ],
      nombre: "Pez Hacha",
      descripcionAnimal:
          "El pez hacha es conocido por su cuerpo delgado y comprimido, similar a una hoja. Vive en aguas tropicales y suele tener adaptaciones únicas para la vida en la superficie del agua.",
      descripcionHabitat:
          "Los peces hacha son comunes en ríos y arroyos de la selva tropical.",
      descripcionComportamiento:
          "Los peces hacha son expertos en nadar cerca de la superficie del agua, donde pueden cazar insectos y otros pequeños organismos. Algunas especies también emiten luz.",
      descripcionAlimentacion:
          "Su dieta incluye principalmente insectos y otros organismos que se encuentran en la superficie del agua. Algunas especies también pueden alimentarse de pequeños peces.",
      ),
      AnimalInfo(
        identificadorQR: "tangFish",
        imageList: [
        'assets/yt1.jpg',
        'assets/yt2.jpg',
        'assets/yt3.jpg',
      ],
        nombre: "Pez Cirujano",
        descripcionAnimal:
            "El pez cirujano, o tang, es conocido por su cuerpo discoidal y la espina afilada en ambos lados de la cola. Son peces marinos coloridos y activos.",
        descripcionHabitat:
            "Los peces cirujano se encuentran en arrecifes de coral y aguas tropicales del océano Índico y el Pacífico.",
        descripcionComportamiento:
            "Los tangs son nadadores activos que se alimentan de algas. Son sociales pero pueden mostrar agresividad hacia otros peces de su misma especie en acuarios más pequeños.",
        descripcionAlimentacion:
            "Su dieta se compone principalmente de algas, aunque también pueden comer alimentos comerciales para peces marinos y algunos tipos de alimentos frescos.",
      ),
      AnimalInfo(
        identificadorQR: "neonTetra",
        imageList: [
        'assets/nt1.jpg',
        'assets/nt2.jpg',
        'assets/nt3.jpg',
      ],
        nombre: "Tetra Neón",
        descripcionAnimal:
            "El tetra neón es un pequeño pez tropical conocido por su atractiva coloración azul brillante y rojo. Es popular en acuarios comunitarios.",
        descripcionHabitat:
            "Los tetras neón son nativos de las aguas tropicales de América del Sur, como la cuenca del río Amazonas.",
        descripcionComportamiento:
            "Son peces pacíficos y deben mantenerse en grupos para sentirse seguros. A menudo nadan en grupos y son compatibles con otros peces de acuario de tamaño similar.",
        descripcionAlimentacion:
            "La dieta del tetra neón incluye alimentos en escamas, alimentos congelados y alimentos vivos pequeños. Son omnívoros.",
      ),    
  ];

  AnimalInfo? getAnimalWithQR(String identificadorQR){
    for (AnimalInfo animal in animales){
      if(animal.identificadorQR == identificadorQR){
        return animal;
      }
    }
    return null;
  }

}

final animalInfoProvider = _AnimalInfoProvider();
