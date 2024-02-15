import 'package:flutter/material.dart';
import 'package:unidad_1/ApiDog/dog_page.dart';
import 'package:unidad_1/Contactos/contactos_page.dart';
import 'package:unidad_1/Contador/contador_page.dart';
import 'package:unidad_1/Examen/productos_page.dart';
import 'package:unidad_1/Future/ejemplo_page.dart';
import 'package:unidad_1/Widgets/Practica_Layout.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      title: "Mi primer App",
      home: const ExamenU1Page(),
    );
  }
}
