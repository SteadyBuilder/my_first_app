import 'package:flutter/material.dart';

void main() {
  runApp(UpdateScreenApp());
}

class UpdateScreenApp extends StatefulWidget {
  @override
  _UpdateScreenAppState createState() => _UpdateScreenAppState();
}

class _UpdateScreenAppState extends State<UpdateScreenApp> {
  String message = 'Hello, Flutter!';

  void updateMessage() {
    setState(() {
      message = '버튼을 클릭했습니다!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('화면 업데이트 예제')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateMessage,
                child: Text('눌러보세요'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
