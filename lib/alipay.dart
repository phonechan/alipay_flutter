import 'alipay_platform_interface.dart';

class Alipay {
  Future<Map?> alipay(String? paymentString) {
    return AlipayPlatform.instance.alipay(paymentString);
  }
}
