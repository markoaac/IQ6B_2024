import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio1"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(
              height: 20,
            ),
            BodyWidget(),
            SizedBox(
              height: 20,
            ),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.amber,
          width: 300,
          height: 200,
        ),
      ],
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 75,
          height: 75,
          color: Colors.lightBlue,
        ),
        Container(
          width: 75,
          height: 75,
          color: Colors.purpleAccent,
        ),
        Container(
          width: 75,
          height: 75,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
            ),
            Text(
              "Rojo",
              style: TextStyle(fontSize: 30),
            ),
            Icon(
              Icons.adb_rounded,
              size: 80,
            ),
          ],
        )
      ],
    );
  }
}
