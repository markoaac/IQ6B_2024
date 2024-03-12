import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unidad_1/firebase/models/producto.dart';
import 'package:unidad_1/firebase/services/servicios_firebase.dart';
import 'package:unidad_1/firebase/widgets/formTextField.dart';

class AgregarProductosPage extends StatefulWidget {
  const AgregarProductosPage({super.key});

  @override
  State<AgregarProductosPage> createState() => _AgregarProductosPageState();
}

class _AgregarProductosPageState extends State<AgregarProductosPage> {
  final formKey = GlobalKey<FormState>();
  final txtNombreController = TextEditingController();
  final txtPrecioController = TextEditingController();
  final txtStockController = TextEditingController();

  File? imagen;
  String url = "";
  String nombre = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                FormTextField(
                    esPassword: false,
                    txtController: txtNombreController,
                    icono: Icons.adb_rounded,
                    prop: "nombre",
                    inputType: TextInputType.text),
                FormTextField(
                  esPassword: false,
                  txtController: txtPrecioController,
                  icono: Icons.attach_money,
                  prop: "precio",
                  inputType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
                FormTextField(
                  txtController: txtStockController,
                  icono: Icons.swap_vert_circle_outlined,
                  prop: "stock",
                  inputType: TextInputType.number,
                  esPassword: false,
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () async {
                    seleccionarImagenCamara();
                  },
                  minWidth: double.maxFinite,
                  height: 55,
                  color: Colors.green,
                  child: const Text(
                    "Agregar foto",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(url),
                imagen != null
                    ? Image.file(imagen!)
                    : const Text("Imagen no seleccionada"),
                OutlinedButton(
                  onPressed: () async {
                    // if (formKey.currentState!.validate()) {
                    //   Producto p = Producto(
                    //       nombre: txtNombreController.value.text,
                    //       precio: double.parse(txtPrecioController.text),
                    //       stock: int.parse(txtStockController.text));

                    //   int codigo = await agregarProducto(p);
                    //   if (!mounted) return;
                    //   if (codigo == 200) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(
                    //         content: Text(txtNombreController.value.text),
                    //       ),
                    //     );
                    //     Navigator.of(context)
                    //         .pushNamedAndRemoveUntil("/", (route) => false);
                    //   }
                    // }

                    final file = File(imagen!.path);

                    final metadata =
                        SettableMetadata(contentType: "image/jpeg");

                    final storageRef = FirebaseStorage.instance.ref("/iq6b");
                    // String fileName = imagen!.path.split('/').last;
                    final uploadTask =
                        storageRef.child(nombre).putFile(file, metadata);

                    SmartDialog.showLoading(msg: "Subiendo");

                    uploadTask.snapshotEvents
                        .listen((TaskSnapshot taskSnapshot) async {
                      switch (taskSnapshot.state) {
                        case TaskState.running:
                          final progress = 100.0 *
                              (taskSnapshot.bytesTransferred /
                                  taskSnapshot.totalBytes);
                          //print("Upload is $progress% complete.");
                          break;
                        case TaskState.paused:
                          //print("Upload is paused.");
                          break;
                        case TaskState.canceled:
                          //print("Upload was canceled");
                          break;
                        case TaskState.error:
                          // Handle unsuccessful uploads

                          break;
                        case TaskState.success:
                          // Handle successful uploads on complete
                          // ...
                          url = await storageRef.child(nombre).getDownloadURL();
                          SmartDialog.dismiss();
                          setState(() {});
                          break;
                      }
                    });
                  },
                  child: const Text("Agregar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future seleccionarImagenGaleria() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    setState(() {
      imagen = File(picture!.path);
    });
  }

  Future seleccionarImagenCamara() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picture == null) return;
    setState(() {
      imagen = File(picture!.path);
      nombre = picture.name;
    });
  }
}
