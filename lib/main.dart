import 'package:flutter/material.dart';
import 'package:my_first_app/my_project/hello.dart';
import 'package:my_first_app/my_project/counter.dart';
import 'package:my_first_app/my_project/todo.dart';
import 'package:my_first_app/my_project/calculator.dart';
import 'package:my_first_app/my_project/quote_app.dart';
import 'package:my_first_app/my_project/random_color_app.dart';

void main() {
  runApp(MultiFeatureApp());
}

class MultiFeatureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '100 Mini Projects',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {'name': 'Hello', 'widget': const HelloPage()},
    {'name': 'Counter', 'widget': const CounterScreen()},
    {'name': 'Todo', 'widget': const TodoScreen()},
    {'name': 'Calculator', 'widget': CalculatorScreen()},
    {'name': 'Quote App', 'widget': const QuoteScreen()},
    {'name': 'RandomColorApp', 'widget': AnimatedColorScreen()},
    // 계속 추가...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('100 Mini Projects')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index]['name']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => projects[index]['widget'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
