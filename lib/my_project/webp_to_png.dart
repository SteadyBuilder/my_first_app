import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

// ignore: non_constant_identifier_names
void webp_to_png() {
  final webpFile = File('input.webp');
  final pngFile = File('output.png');

  final webpImage = img.decodeWebP(webpFile.readAsBytesSync());
  if (webpImage != null) {
    pngFile.writeAsBytesSync(img.encodePng(webpImage));
    debugPrint('변환 완료!');
  } else {
    debugPrint('변환 실패.');
  }
}
