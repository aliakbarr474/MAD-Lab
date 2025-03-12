import 'package:flutter/material.dart';

void main() {
  runApp(const BoxApp());
}

class BoxApp extends StatelessWidget {
  const BoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Task2'), centerTitle: true),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Center(
              child: Container(width: 100, height: 100, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
