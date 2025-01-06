import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "";

  void _calculate(String operator) {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        _result = "올바른 숫자를 입력하세요!";
      });
      return;
    }

    setState(() {
      switch (operator) {
        case '+':
          _result = "결과: ${num1 + num2}";
          break;
        case '-':
          _result = "결과: ${num1 - num2}";
          break;
        case '*':
          _result = "결과: ${num1 * num2}";
          break;
        case '/':
          if (num2 == 0) {
            _result = "0으로 나눌 수 없습니다!";
          } else {
            _result = "결과: ${num1 / num2}";
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("간단한 계산기")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(
                labelText: "첫 번째 숫자",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(
                labelText: "두 번째 숫자",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: Text("*"),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: Text("/"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
