import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:format/format.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unidad_1/firebase/models/producto.dart';
import 'package:unidad_1/firebase/provider/globales.dart';
import 'package:unidad_1/firebase/services/servicios_firebase.dart';
import 'package:unidad_1/firebase/widgets/cardProducto.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formato =
        NumberFormat.simpleCurrency(decimalDigits: 2, locale: "es_MX");

    final Stream<QuerySnapshot> productosStream =
        FirebaseFirestore.instance.collection("productos").snapshots();

    final globales = context.watch<Globales>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, "/agregarProductos");
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: productosStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Ha ocurrido un error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((e) {
              //Map<String, dynamic> producto = e.data()! as Map<String, dynamic>;
              Producto p = Producto.getFirebaseId(
                  e.id, e.data() as Map<String, dynamic>);
              return CardProducto(producto: p);

              // return ListTile(
              //   leading: CircleAvatar(
              //     child: Image.network(
              //       producto['url'] ??
              //           "https://cdn-icons-png.flaticon.com/512/2748/2748558.png",
              //       loadingBuilder: (context, child, loadingProgress) {
              //         if (loadingProgress == null) return child;
              //         return Center(
              //           child: CircularProgressIndicator(
              //             value: loadingProgress.expectedTotalBytes != null
              //                 ? loadingProgress.cumulativeBytesLoaded /
              //                     loadingProgress.expectedTotalBytes!
              //                 : null,
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              //   title: Text(
              //     "${producto['nombre']} - ${e.id}",
              //     style: const TextStyle(fontSize: 15),
              //   ),
              // );
            }).toList(),
          );
        },
      ),

      // body: FutureBuilder(
      //   future: getProductos(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data?.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             title: Text(snapshot.data?[index].id ?? "sn"),
      //             subtitle: Text(
      //               formato.format(snapshot.data?[index].precio),
      //             ),
      //             trailing: const Icon(Icons.arrow_right),
      //             onTap: () {
      //               Navigator.pushNamed(context, '/actualizarProducto',
      //               arguments: snapshot.data?[index]);
      //             },
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
