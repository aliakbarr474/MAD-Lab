import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Grid View',
      home: ResponsiveGridPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveGridPage extends StatelessWidget {
  final List<String> imageUrls = [
    // Online images
    'https://picsum.photos/200/300',
    'https://picsum.photos/250/300',
    'https://picsum.photos/300/300',
    'https://picsum.photos/200/250',
    'https://picsum.photos/300/250',
    'https://picsum.photos/240/340',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Grid')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = (constraints.maxWidth ~/ 150).toInt();

          return GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: imageUrls.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              final isNetwork = imageUrl.startsWith('http');

              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      isNetwork
                          ? Image.network(imageUrl, fit: BoxFit.cover)
                          : Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
