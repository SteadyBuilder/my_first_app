import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuoteScreen(),
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State {
  String _quote = "명언을 불러오는 중...";
  String _author = "";

  // 명언 API 호출 함수
  Future _fetchQuote() async {
    final url = Uri.parse("https://zenquotes.io/api/random");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          _quote = data[0]['q']; // 명언
          _author = data[0]['a']; // 작성자
        });
      } else {
        setState(() {
          _quote = "명언을 불러오지 못했습니다.";
        });
      }
    } catch (error) {
      setState(() {
        _quote = "오류가 발생했습니다.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchQuote(); // 초기화 시 명언 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("랜덤 명언 앱"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _quote,
              style: const TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "- $_author",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _fetchQuote,
              child: const Text("새 명언 가져오기"),
            ),
          ],
        ),
      ),
    );
  }
}
