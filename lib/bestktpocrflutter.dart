
import 'dart:typed_data';

import 'bestktpocrflutter_platform_interface.dart';

class Bestktpocrflutter {

  Future<String?> scanKTP(Uint8List image) {
    return BestktpocrflutterPlatform.instance.scanKTP(image);
  }
}
