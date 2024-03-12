import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:unidad_1/firebase/models/responseAuth.dart';
import 'package:unidad_1/firebase/provider/globales.dart';
import 'package:unidad_1/firebase/services/servicios_firebase.dart';
import 'package:unidad_1/firebase/widgets/formTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final txtCorreoController = TextEditingController();
  final txtPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final globales = context.watch<Globales>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormTextField(
                  txtController: txtCorreoController,
                  icono: Icons.email,
                  prop: "Correo",
                  inputType: TextInputType.emailAddress,
                  esPassword: false,
                ),
                FormTextField(
                  txtController: txtPasswordController,
                  icono: Icons.password,
                  prop: "Contraseña",
                  inputType: TextInputType.text,
                  esPassword: true,
                ),
                MaterialButton(
                  minWidth: double.maxFinite, // set minWidth to maxFinite
                  height: 50,
                  color: Colors.green,
                  elevation: 5,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () async {
                    ResponseAuth res = await login(
                        txtCorreoController.text, txtPasswordController.text);
                    if (!context.mounted) return;
                    if (res.codigo == 200) {
                      globales.correo = txtCorreoController.text;
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/Inicio", (route) => false);
                    } else {
                      SmartDialog.showToast(res.mensaje);
                    }
                  },
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
