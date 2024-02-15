import 'package:flutter/material.dart';
import 'Dog.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  //Dog dog = Dog(estatus: "", foto: "");

  Future<Dog> getDog() async {
    final urlDogApi = Uri.parse("https://dog.ceo/api/breeds/image/random");
    final respuesta = await http.get(urlDogApi);
    Dog d = Dog.getJSON(json.decode(respuesta.body));
    return d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API DOG"),
      ),
      body: FutureBuilder(
        future: getDog(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String imageURL = snapshot.data?.foto ?? '';
            String estatus = snapshot.data?.estatus ?? 'Sin datos';
            return Image.network(
              imageURL,
              scale: 1,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
