import 'package:flutter/material.dart';
import 'package:unidad_1/firebase/models/producto.dart';

class ActualizarProductoPage extends StatefulWidget {
  const ActualizarProductoPage({super.key});

  @override
  State<ActualizarProductoPage> createState() => _ActualizarProductoPageState();
}

class _ActualizarProductoPageState extends State<ActualizarProductoPage> {
  final formKey = GlobalKey<FormState>();
  final txtNombreController = TextEditingController();
  final txtPrecioController = TextEditingController();
  final txtStockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Producto producto =
        ModalRoute.of(context)!.settings.arguments as Producto;
    txtNombreController.text = producto.nombre;
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.nombre),
      ),
      body: const Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
