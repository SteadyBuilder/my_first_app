import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerApp extends StatelessWidget {
  const QRScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScannerScreen(),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool _isDialogVisible = false; // 중복 얼럿 방지

  void _showScanResult(BuildContext context, String result) {
    if (_isDialogVisible) return; // 이미 얼럿이 표시 중이면 무시
    _isDialogVisible = true;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("스캔 결과"),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                _isDialogVisible = false;
                Navigator.of(context).pop();
              },
              child: const Text("닫기"),
            ),
          ],
        );
      },
    ).then((_) => _isDialogVisible = false); // 다이얼로그가 닫히면 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR 코드 스캐너")),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Barcode? barcode = barcodes.isNotEmpty ? barcodes.first : null;

          if (barcode != null && barcode.rawValue != null) {
            _showScanResult(context, barcode.rawValue!);
          }
        },
      ),
    );
  }
}
