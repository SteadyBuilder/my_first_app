import 'package:flutter/material.dart';

class ImageViewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageViewerScreen(),
    );
  }
}

class ImageViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이미지 뷰어 앱"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: InteractiveViewer(
              child: Image.asset(
                'assets/local_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.network(
                'https://picsum.photos/400',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
