import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bestktpocrflutter_platform_interface.dart';

/// An implementation of [BestktpocrflutterPlatform] that uses method channels.
class MethodChannelBestktpocrflutter extends BestktpocrflutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bestktpocrflutter');


  @override
  Future<String?> scanKTP(Uint8List image) async {
    final jsonString = await methodChannel.invokeMethod<String>('scanKTP',{'ktp':image});
    return jsonString;
  }



}
