import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String prop;
  final TextEditingController txtController;
  final IconData icono;
  final TextInputType inputType;
  final bool esPassword;

  const FormTextField(
      {super.key,
      required this.txtController,
      required this.icono,
      required this.prop,
      required this.inputType,
      required this.esPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        obscureText: esPassword,
        controller: txtController, //
        keyboardType: inputType, //
        decoration: InputDecoration(
          hintText: "Ingrese un $prop", //
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.blue.shade900),
          ),
          suffixIcon: Icon(icono), //
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido';
          }
          return null;
        },
      ),
    );
  }
}
