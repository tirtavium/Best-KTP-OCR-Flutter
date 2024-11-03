import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bestktpocrflutter/bestktpocrflutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBestktpocrflutter platform = MethodChannelBestktpocrflutter();
  const MethodChannel channel = MethodChannel('bestktpocrflutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
   // expect(await platform.getPlatformVersion(), '42');
  });
}
