import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unidad_1/firebase/models/producto.dart';

class CardProducto extends StatefulWidget {
  final Producto producto;

  const CardProducto({super.key, required this.producto});

  @override
  State<CardProducto> createState() => _CardProductoState();
}

class _CardProductoState extends State<CardProducto> {
  bool favorito = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        //To Do
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  widget.producto.url,
                  width: 130,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(200, 255, 255, 255)),
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        favorito = !favorito;
                      });
                      await FirebaseFirestore.instance
                          .collection("productos")
                          .doc(widget.producto.id)
                          .collection("favoritos")
                          .doc()
                          .set({
                        "correo": "marco@gmail.com",
                        "fecha": DateTime.now().toString(),
                        "uid": "oXPzRe4PWkShDV4w8cH0K8fMTj83"
                      });
                    },
                    icon:
                        Icon(favorito ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
