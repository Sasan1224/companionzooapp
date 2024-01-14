import 'package:app_zoo/modelo/user_model.dart';
import 'package:app_zoo/providers/user_provider.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
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
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                child: const Text('Registrarse'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí implementarías la lógica de registro
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registrando usuario')),
                    );
                    if(userProvider.exist(mail: _emailController.text)){
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuario Registrado, por favor inicie sesión.')),
                    );
                    }else{
                      User user = User(mail: _emailController.text,password: _passwordController.text,nombre: _nameController.text);
                      userProvider.insert(user);
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro satisfactorio')),
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