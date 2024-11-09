import 'dart:io';
import 'dart:math';

import 'package:best_ktp_ocr_flutter/bestktpocrflutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _ktpJson = 'Unknown';
  final _bestktpocrflutterPlugin = Bestktpocrflutter();

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  @override
  void initState() {
    super.initState();
    scanKTPImage();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanKTPImage() async {
    String? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {

      final data = await getImageFileFromAssets("images/KTP_Sample.png");
      _ktpJson =
          await _bestktpocrflutterPlugin.scanKTP(data.readAsBytesSync());
      print(_ktpJson);
    } on PlatformException {
      _ktpJson = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_ktpJson'),
        ),
      ),
    );
  }
}
