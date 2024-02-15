import 'package:flutter/material.dart';

class EjemploFuturePage extends StatefulWidget {
  const EjemploFuturePage({super.key});

  @override
  State<EjemploFuturePage> createState() => _EjemploFuturePageState();
}

class _EjemploFuturePageState extends State<EjemploFuturePage> {
  // Future<int> obtenerValor() {
  //   return Future.delayed(const Duration(seconds: 5), () {
  //     return 10;
  //   });
  // }

  Future<int> obtenerValor() async {
    await Future.delayed(const Duration(seconds: 5));
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo Future"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: obtenerValor(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                default:
                  if (snapshot.hasError) {
                    return const Text("Error");
                  } else if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(fontSize: 50),
                    );
                  } else {
                    return const Text("No hay información");
                  }
              }

              // if (snapshot.hasData) {
              //   return Text(
              //     snapshot.data.toString(),
              //     style: const TextStyle(fontSize: 50),
              //   );
              // } else {
              //   return const CircularProgressIndicator();
              // }
            },
          )
        ],
      ),
    );
  }
}
