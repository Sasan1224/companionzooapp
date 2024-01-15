import 'package:app_zoo/modelo/animal_info.dart';
import 'package:app_zoo/providers/animal_info_provider.dart';
import 'package:app_zoo/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatelessWidget {
  String previousQR="";

  QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (capture){
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
                if(previousQR != barcode.rawValue.toString()){
                  AnimalInfo? animal = animalInfoProvider.getAnimalWithQR(barcode.rawValue.toString());
                  if(animal!=null){
                    previousQR = barcode.rawValue.toString();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalInfoScreen(animal: animal)));
                  }
                }
              }
              previousQR = "";
            },
          ),
           Center(
            child: CustomPaint(
              painter: CornerPainter(),
            ),),
        ],
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Dibuja las esquinas blancas
    const double cornerSize = 20.0;
    const double cornerLineWidth = 4.0;

    // Esquina superior izquierda
    canvas.drawLine(
        const Offset(0, 0), const Offset(cornerSize, 0), paint..strokeWidth = cornerLineWidth);
    canvas.drawLine(
        const Offset(0, 0), const Offset(0, cornerSize), paint..strokeWidth = cornerLineWidth);

    // Esquina superior derecha
    canvas.drawLine(
        Offset(size.width, 0),
        Offset(size.width - cornerSize, 0),
        paint..strokeWidth = cornerLineWidth);
    canvas.drawLine(
        Offset(size.width, 0),
        Offset(size.width, cornerSize),
        paint..strokeWidth = cornerLineWidth);

    // Esquina inferior izquierda
    canvas.drawLine(
        Offset(0, size.height),
        Offset(0, size.height - cornerSize),
        paint..strokeWidth = cornerLineWidth);
    canvas.drawLine(
        Offset(0, size.height),
        Offset(cornerSize, size.height),
        paint..strokeWidth = cornerLineWidth);

    // Esquina inferior derecha
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width - cornerSize, size.height),
        paint..strokeWidth = cornerLineWidth);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width, size.height - cornerSize),
        paint..strokeWidth = cornerLineWidth);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}