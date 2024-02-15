import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 50,
              child: FlutterLogo(
                size: 80,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            const Icon(
              Icons.alarm,
              size: 80,
            )
          ],
        ),
      ),
    );
  }
}
