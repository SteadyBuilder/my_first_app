import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedColorScreen(),
    );
  }
}

class AnimatedColorScreen extends StatefulWidget {
  @override
  _AnimatedColorScreenState createState() => _AnimatedColorScreenState();
}

class _AnimatedColorScreenState extends State<AnimatedColorScreen> {
  Color _backgroundColor = Colors.white; // 초기 배경색

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        255,
        Random().nextInt(255), // Red 값
        Random().nextInt(255), // Green 값
        Random().nextInt(255), // Blue 값
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor, // 화면 터치 시 색상 변경
      child: AnimatedContainer(
        duration: Duration(seconds: 1), // 애니메이션 지속 시간
        color: _backgroundColor,
        child: Center(
          child: Text(
            "화면을 터치하세요!",
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
