import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unidad_1/Examen/producto.dart';
import 'package:unidad_1/Examen/producto_item.dart';

class ExamenU1Page extends StatelessWidget {
  const ExamenU1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final productos = [
      Producto(
          "Cubos para caballeros para diferentes actividades recreativas en un lúgar público",
          "Descripción 1",
          "assets/1.png",
          25.50),
      Producto("Item 2", "Descripción 2", "assets/2.png", 25.50),
      Producto("Item 3", "Descripción 3", "assets/3.png", 25.50),
      Producto("Item 4", "Descripción 4", "assets/4.png", 25.50)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text("Amazon"),
      ),
      body: Column(
        children: [
          const Text("Resultados de la búsqueda",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ProductoItem(p: productos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
