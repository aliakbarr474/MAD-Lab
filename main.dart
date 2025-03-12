import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widget App'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1741557571786-e922da981949?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              height: 200,
              width: 300,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, size: 40, color: Colors.blue),
                Text(
                  'Flutter Widgets',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.favorite, size: 40, color: Colors.red),
              ],
            ),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text('Click Me')),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
