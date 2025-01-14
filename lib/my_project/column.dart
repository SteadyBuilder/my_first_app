import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column Example')),
        body: Column(
          children: [
            Text('첫 번째 텍스트'),
            Text('두 번째 텍스트'),
            Text('세 번째 텍스트'),
          ],
        ),
      ),
    );
  }
}
