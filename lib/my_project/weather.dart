import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _cityName = "Seoul";
  String _weatherDescription = "날씨 정보를 가져오는 중...";
  String _temperature = "-";
  String _icon = "";

  Future<void> _fetchWeather() async {
    final apiKey =
        "30515fb31f21db1ada58af7b418495ed"; // OpenWeatherMap API 키 입력
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$apiKey&units=metric");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _weatherDescription = data['weather'][0]['description'];
          _temperature = data['main']['temp'].toString();
          _icon = data['weather'][0]['icon'];
        });
      } else {
        setState(() {
          _weatherDescription = "날씨 정보를 불러올 수 없습니다.";
        });
      }
    } catch (error) {
      setState(() {
        _weatherDescription = "오류가 발생했습니다.";
      });
      print("Error: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("날씨 앱"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (_icon.isNotEmpty)
              Image.network(
                "https://openweathermap.org/img/wn/$_icon@2x.png",
                scale: 1.5,
              ),
            Text(
              "$_temperature°C",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _weatherDescription,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text("새로고침"),
            ),
          ],
        ),
      ),
    );
  }
}
