import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bestktpocrflutter_method_channel.dart';

abstract class BestktpocrflutterPlatform extends PlatformInterface {
  /// Constructs a BestktpocrflutterPlatform.
  BestktpocrflutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BestktpocrflutterPlatform _instance = MethodChannelBestktpocrflutter();

  /// The default instance of [BestktpocrflutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBestktpocrflutter].
  static BestktpocrflutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BestktpocrflutterPlatform] when
  /// they register themselves.
  static set instance(BestktpocrflutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> scanKTP(Uint8List image) {
    throw UnimplementedError('scanKTP() has not been implemented.');
  }
}
