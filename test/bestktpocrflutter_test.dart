import 'dart:typed_data';

import 'package:best_ktp_ocr_flutter/bestktpocrflutter_method_channel.dart';
import 'package:best_ktp_ocr_flutter/bestktpocrflutter_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBestktpocrflutterPlatform
    with MockPlatformInterfaceMixin
    implements BestktpocrflutterPlatform {



  @override
  Future<String?> scanKTP(Uint8List image) {
    // TODO: implement scanKTP
    throw UnimplementedError();
  }
}

void main() {
  final BestktpocrflutterPlatform initialPlatform = BestktpocrflutterPlatform.instance;

  test('$MethodChannelBestktpocrflutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBestktpocrflutter>());
  });

  // test('getPlatformVersion', () async {
  //   Bestktpocrflutter bestktpocrflutterPlugin = Bestktpocrflutter();
  //   MockBestktpocrflutterPlatform fakePlatform = MockBestktpocrflutterPlatform();
  //   BestktpocrflutterPlatform.instance = fakePlatform;

  //   //expect(await bestktpocrflutterPlugin.getPlatformVersion(), '42');
  // });
}
