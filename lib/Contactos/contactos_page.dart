import 'package:flutter/material.dart';
import 'package:unidad_1/Contactos/contacto.dart';

class ContactosPage extends StatelessWidget {
  ContactosPage({super.key});

  final Contacto contacto = Contacto(
      casado: true, nombre: "marco", foto: '', numero: "123", edad: 20);

  final List<Contacto> contactos = [
    Contacto(nombre: "Hugo", edad: 20, numero: "226", casado: true),
    Contacto(nombre: "María", edad: 30, numero: "231", casado: true),
    Contacto(nombre: "Luis", edad: 15, numero: "222", casado: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red[800],
              child: Text(
                contactos[index].nombre[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(contactos[index].nombre),
            subtitle: Text(contactos[index].numero),
            trailing: const Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
