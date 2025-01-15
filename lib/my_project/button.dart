import 'package:flutter/material.dart';

void main() {
  runApp(ButtonExampleApp());
}

class ButtonExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('버튼 예제')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print('버튼 클릭!');
            },
            child: Text('클릭하세요'),
          ),
        ),
      ),
    );
  }
}
