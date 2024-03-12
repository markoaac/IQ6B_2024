import 'package:flutter/material.dart';
import 'package:unidad_1/firebase/models/producto.dart';

class Globales extends ChangeNotifier {
  String correo = "";
  List<Producto> carrito = [];

  void agregarProducto(Producto p) {
    carrito.add(p);
  }
}
