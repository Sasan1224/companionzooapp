import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  // Crear las claves para los formularios y los campos de texto
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su usuario';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true, // Para ocultar la contraseña
                decoration: InputDecoration(
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
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Iniciar Sesión'),
                onPressed: () {
                  // Valida el formulario y si es correcto, procede al inicio de sesión
                  if (_formKey.currentState!.validate()) {
                    // Aquí se manejaría el inicio de sesión
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Procesando datos')),
                    );
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
