import 'package:flutter/material.dart';

class DatosPage extends StatelessWidget {
  const DatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

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
