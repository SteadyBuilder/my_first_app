import 'package:flutter/material.dart';

class ColumnRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column Example')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('첫번째'),
                Text('두번째'),
                Text('세번째'),
              ],
            ),
            Text('아래'),
          ],
        ),
      ),
    );
  }
}
