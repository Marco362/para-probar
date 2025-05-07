import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _passwordController = TextEditingController();

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _mostrarMensaje('Icono de búsqueda tocado'),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => _mostrarMensaje('Icono de favorito tocado'),
          ),
          IconButton(
            icon: const Icon(Icons.access_alarm),
            onPressed: () => _mostrarMensaje('Icono de alarma tocado'),
          ),
          IconButton(
            onPressed: () => _mostrarMensaje('Icono de comida tocado'), icon: Icon(Icons.food_bank),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey, 
                  foregroundColor: Colors.white
                  ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      '/datos',
                      arguments: {
                        'nombre': _nombreController.text,
                        'password': _passwordController.text,
                      },
                    );
                  }
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => _mostrarMensaje('Icono de inicio tocado'),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => _mostrarMensaje('Icono de configuración tocado'),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => _mostrarMensaje('Icono de perfil tocado'),
            ),
          ],
        ),
      ),
    );
  }
}
