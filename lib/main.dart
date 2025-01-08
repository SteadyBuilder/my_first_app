import 'package:flutter/material.dart';
import 'package:my_first_app/my_project/hello.dart';
import 'package:my_first_app/my_project/counter.dart';
import 'package:my_first_app/my_project/todo.dart';
import 'package:my_first_app/my_project/calculator.dart';
import 'package:my_first_app/my_project/quote_app.dart';
import 'package:my_first_app/my_project/random_color_app.dart';
import 'package:my_first_app/my_project/splash.dart';
import 'package:my_first_app/my_project/memo.dart';
import 'package:my_first_app/my_project/tabs.dart';
import 'package:my_first_app/my_project/img_view.dart';
import 'package:my_first_app/my_project/weather.dart';
import 'package:my_first_app/my_project/QRGenerator.dart';
import 'package:my_first_app/my_project/QRScanner.dart';

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
    {'name': '카운터 앱', 'widget': const CounterScreen()},
    {'name': '할일 목록 앱', 'widget': const TodoScreen()},
    {'name': '계산기 앱', 'widget': CalculatorScreen()},
    {'name': '랜덤 명언 앱', 'widget': const QuoteScreen()},
    {'name': '랜덤 배경 색상 변경 앱', 'widget': AnimatedColorScreen()},
    {'name': '로딩 화면', 'widget': SplashScreen()},
    {'name': '메모 앱', 'widget': MemoScreen()},
    {'name': '탭바 앱', 'widget': TabsScreen()},
    {'name': '이미지뷰어 앱', 'widget': ImageViewerScreen()},
    {'name': '날씨 앱', 'widget': WeatherScreen()},
    {'name': 'QR 코드 생성기', 'widget': QRGeneratorScreen()},
    {'name': 'QR 코드 스캐너', 'widget': QRScannerScreen()},
    // 계속 추가...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('100 Mini Projects')),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projects[index]['name']),
            trailing: const Icon(Icons.arrow_forward),
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
