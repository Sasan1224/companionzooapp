import 'package:app_zoo/providers/user_provider.dart';
import 'package:app_zoo/screens/main_app_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  // Crear las claves para los formularios, campos de texto y controllers
  final _formKey = GlobalKey<FormState>();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _mailController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Para ocultar la contraseña
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Iniciar Sesión'),
                onPressed: () {
                  // Valida el formulario y si es correcto, procede al inicio de sesión
                  if (_formKey.currentState!.validate()) {
                    // Aquí se manejaría el inicio de sesión
                    if(userProvider.selectUserFromCredentials(mail: _mailController.text, password: _passwordController.text)!=null){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainAppScreen()));
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('¡Credenciales invalidas!')),
                    );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
