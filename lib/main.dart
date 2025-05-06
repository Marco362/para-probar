import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Aplicación',
      initialRoute: '/', // Define la ruta inicial
      routes: {
        '/': (context) => const LoginPage(), // Ruta para la página de login
        '/datos': (context) => const DatosPage(), // Ruta para la página de datos
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState(); // Esto debe devolver un _LoginPageState
}

class _LoginPageState extends State<LoginPage> {
  // Corregido: extiende de State<LoginPage>
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _passwordController = TextEditingController();

  // Función para mostrar el mensaje del icono
  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensaje)));
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navega a la página de datos y pasa los datos
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

class DatosPage extends StatelessWidget {
  const DatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibe los datos del Login
    final datos =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: const Text('Datos Ingresados')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre: ${datos['nombre']}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Contraseña: ${datos['password']}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver al Login'),
            ),
          ],
        ),
      ),
    );
  }
}
