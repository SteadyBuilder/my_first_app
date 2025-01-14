import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: Text(
            'Hello World App',
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Text(
            'Hello,\nSteadyBuilder!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 255, 191),
            ),
          ),
        ),
      ),
    );
  }
}
