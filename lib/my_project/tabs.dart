import 'package:flutter/material.dart';

class TabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(),
    );
  }
}

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("탭바 앱"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "홈"),
              Tab(icon: Icon(Icons.settings), text: "설정"),
              Tab(icon: Icon(Icons.person), text: "프로필"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            SettingsTab(),
            ProfileTab(),
          ],
        ),
      ),
    );
  }
}

// 각 탭 화면 구성
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "여기는 홈 화면입니다.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "설정 화면에 오신 것을 환영합니다.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "프로필 화면입니다.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
