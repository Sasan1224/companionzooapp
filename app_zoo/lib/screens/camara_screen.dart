import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:app_zoo/screens/qr_scanner_screen.dart';
import 'package:app_zoo/utils/initialize_cameras.dart';
import 'package:app_zoo/widgets/layout.dart';
import 'package:app_zoo/widgets/text_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';



class CamaraScreen extends StatefulWidget {
  const CamaraScreen({super.key});

  @override
  State<CamaraScreen> createState() => _CamaraScreenState();
}

class _CamaraScreenState extends State<CamaraScreen> {
  late CameraController controller;
  int? index;
  CameraImage? img;
  CameraDescription backCamera = cameras[0];
  @override
  bool mounted = true;

  @override
  void initState() {
    super.initState();
    controller = CameraController(backCamera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      controller.startImageStream((image) => {});
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Errores de cámara
            break;
          default:
            // Errores de cámara.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(
        child: TextView(
          text: "Camera preview",
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
        ),
      );
    }

    return Layout(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CameraPreview(controller),
          ),
          Positioned(
            right: 10,
            bottom: 16,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.qr_code_scanner),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  const QrScreen()));
              },
              iconSize: 36,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: IconButton(
                onPressed: () => takePicture(context),
                icon: const Icon(
                  CupertinoIcons.camera_fill,
                  size: 36,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void takePicture(BuildContext context) async {
    if (!controller.value.isInitialized) {
      return;
    }

    try {
      final XFile picture = await controller.takePicture();
      final fileName = DateTime.now().toIso8601String();

      final result = await ImageGallerySaver.saveFile(picture.path,name: fileName);
      if (result != null && result.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Imagen Guardada en galeria.')),
                    );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No se pudo guardar la imagen')),
                    );
      }
    } catch (e) {
      print("Error taking picture: $e");
    }
  }
}