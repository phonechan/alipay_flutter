
import 'alipay_platform_interface.dart';

class Alipay {
  Future<String?> getPlatformVersion() {
    return AlipayPlatform.instance.getPlatformVersion();
  }
}
