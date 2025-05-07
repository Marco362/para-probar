import 'package:flutter/material.dart';
import './presentation/pages/login_page.dart';
import './presentation/pages/datos_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/datos': (context) => const DatosPage(),
      },
    );
  }
}
