import 'package:flutter/material.dart';

class CamaraScreen extends StatelessWidget {
  const CamaraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cámara")),
      body: const Center(child: Text("Camara")),
    );
  }
}