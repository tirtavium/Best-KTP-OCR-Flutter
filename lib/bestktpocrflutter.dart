
import 'bestktpocrflutter_platform_interface.dart';

class Bestktpocrflutter {
  Future<String?> getPlatformVersion() {
    return BestktpocrflutterPlatform.instance.getPlatformVersion();
  }
}
