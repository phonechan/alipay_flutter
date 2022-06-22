import 'alipay_platform_interface.dart';

class Alipay {
  Future<Map?> alipay(String? paymentString, String? urlScheme) {
    return AlipayPlatform.instance.alipay(paymentString, urlScheme);
  }
}
