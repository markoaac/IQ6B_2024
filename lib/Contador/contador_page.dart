import 'dart:math';

import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo Stateful"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              cont.toString(),
              style: const TextStyle(fontSize: 55),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.asset("assets/mapache.png"),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.plus_one),
              onPressed: () {
                setState(() {
                  cont = Random().nextInt(100);
                });
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                setState(() {
                  cont--;
                });
              }),
        ],
      ),
    );
  }
}
