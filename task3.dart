import 'package:flutter/material.dart';

void main() => runApp(DashboardApp());

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Layout',
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<DashboardItem> items = [
    DashboardItem(
      title: 'Users',
      value: '1,245',
      icon: Icons.person,
      color: Colors.blue,
    ),
    DashboardItem(
      title: 'Revenue',
      value: '\$58,000',
      icon: Icons.attach_money,
      color: Colors.green,
    ),
    DashboardItem(
      title: 'Notifications',
      value: '23',
      icon: Icons.notifications,
      color: Colors.orange,
    ),
    DashboardItem(
      title: 'Tasks',
      value: '17 Pending',
      icon: Icons.task_alt,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth ~/ 200).toInt();

            return GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return DashboardCard(item: items[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap interaction
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${item.title} clicked')));
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 40, color: item.color),
              SizedBox(height: 16),
              Text(
                item.value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: item.color,
                ),
              ),
              SizedBox(height: 8),
              Text(
                item.title,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
