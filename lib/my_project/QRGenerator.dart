import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(QRGeneratorApp());

class QRGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRGeneratorScreen(),
    );
  }
}

class QRGeneratorScreen extends StatefulWidget {
  @override
  _QRGeneratorScreenState createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR 코드 생성기")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "텍스트를 입력하세요",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _controller.text;
                });
              },
              child: const Text("QR 코드 생성"),
            ),
            const SizedBox(height: 16),
            if (_qrData.isNotEmpty)
              Center(
                child: QrImageView(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 320.0,
                  gapless: false,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
